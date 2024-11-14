// auth_service.dart
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:laborus_app/core/data/auth_database.dart';
import 'package:laborus_app/core/exceptions/auth_exception.dart';
import 'package:laborus_app/core/exceptions/signup_exception.dart';
import 'package:laborus_app/core/model/responses/auth_response.dart';
import 'package:laborus_app/core/model/users/image_model.dart';
import 'dart:async';

import 'package:laborus_app/core/model/users/school_model.dart';
import 'package:laborus_app/core/model/users/user_modell.dart';

class AuthService {
  static final String _baseUrl =
      dotenv.env['API_URL'] ?? 'https://laborus-backend-api.onrender.com/';

  final AuthDatabase _authDatabase = AuthDatabase();
  Timer? _tokenRefreshTimer;
  final _authStateController = StreamController<bool>.broadcast();

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email.trim(), 'password': password}),
      );

      if (response.statusCode == 200) {
        final authResponse = AuthResponse.fromJson(json.decode(response.body));
        if (authResponse.status == 'SUCCESS' &&
            authResponse.data['token'] != null) {
          final token = authResponse.data['token'];

          await _authDatabase.saveToken(token);
          await _authDatabase.saveUserData(authResponse.data);

          _authStateController.add(true);

          return {'success': true, 'userData': authResponse.data};
        }
      }

      throw AuthException(_parseErrorMessage(response));
    } on TimeoutException {
      throw AuthException(
          'Connection timeout. Please check your internet connection.');
    } catch (e) {
      throw AuthException('Failed to sign in: ${e.toString()}');
    }
  }

  Future<List<SchoolModel>> getSchools() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/api/schools'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);

        // Acessa o caminho correto para a lista de escolas
        final Map<String, dynamic> data = decodedResponse['data'];
        final List<dynamic> schools = data['schools'];

        return schools
            .map((schoolData) => SchoolModel.fromJson(schoolData))
            .toList();
      } else {
        throw Exception('Falha ao carregar escolas: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar escolas: $e');
      throw Exception('Erro ao carregar escolas: $e');
    }
  }

  Future<Map<String, dynamic>> signup(
    UserModel user, {
    ImageModel? profileImageFile,
    ImageModel? bannerImageFile,
  }) async {
    try {
      // Criamos um Map separado para os dados do usuário
      final Map<String, dynamic> userData = user.toJson();

      // Adicionamos as imagens separadamente se existirem
      if (profileImageFile != null) {
        // Verificamos se o base64 está completo e válido
        if (profileImageFile.base64Data != null &&
            profileImageFile.base64Data!.isNotEmpty) {
          userData['profileImage'] = profileImageFile.base64Data;
        }
      }

      if (bannerImageFile != null) {
        if (bannerImageFile.base64Data != null &&
            bannerImageFile.base64Data!.isNotEmpty) {
          userData['bannerImage'] = bannerImageFile.base64Data;
        }
      }

      // Log para debug (remover em produção)
      print('Request payload size: ${json.encode(userData).length}');

      final response = await http.post(
        Uri.parse('$_baseUrl/api/auth/signup'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(userData),
      );

      // Log para debug (remover em produção)
      print('Response status code: ${response.statusCode}');
      print('Response content-type: ${response.headers['content-type']}');

      // Verificação se a resposta é vazia
      if (response.body.isEmpty) {
        throw SignupException(
          'Resposta vazia do servidor',
          code: 'EMPTY_RESPONSE',
        );
      }

      Map<String, dynamic> responseData;
      try {
        responseData = json.decode(response.body) as Map<String, dynamic>;
      } catch (e) {
        // Verifica se o corpo é HTML
        if (response.body.toLowerCase().contains('<!doctype html>') ||
            response.body.toLowerCase().contains('<html')) {
          throw SignupException(
            'Servidor retornou HTML ao invés de JSON',
            code: 'HTML_RESPONSE',
            details: {
              'statusCode': response.statusCode,
              'contentType': response.headers['content-type'],
              'bodyPreview':
                  response.body.substring(0, min(100, response.body.length)),
            },
          );
        }

        // Caso contrário, trata como JSON inválido
        throw SignupException(
          'Resposta do servidor em formato inválido',
          code: 'INVALID_JSON',
          details: {
            'error': e.toString(),
            'bodyPreview':
                response.body.substring(0, min(100, response.body.length)),
            'statusCode': response.statusCode,
            'contentType': response.headers['content-type'],
          },
        );
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseData;
      }

      // Erro do servidor com JSON válido
      throw SignupException(
        responseData['message'] ?? 'Erro ao criar conta',
        code: responseData['code'] ?? response.statusCode.toString(),
        details: responseData['details'] ?? responseData,
      );
    } on http.ClientException catch (e) {
      throw SignupException(
        'Erro de conexão com o servidor',
        code: 'CONNECTION_ERROR',
        details: {'error': e.toString()},
      );
    } catch (e) {
      if (e is SignupException) rethrow;
      throw SignupException(
        'Erro ao criar conta: ${e.toString()}',
        code: 'UNKNOWN_ERROR',
        details: {'originalError': e.toString()},
      );
    }
  }

  Future<void> signOut() async {
    _tokenRefreshTimer?.cancel();
    await _authDatabase.clearAuthData();
    _authStateController.add(false);
  }

  String _parseErrorMessage(http.Response response) {
    try {
      final body = json.decode(response.body);
      return body['message'] ?? 'Unknown error occurred';
    } catch (_) {
      return 'Failed to connect to server';
    }
  }

  Future<void> dispose() async {
    _tokenRefreshTimer?.cancel();
    await _authStateController.close();
  }
}
