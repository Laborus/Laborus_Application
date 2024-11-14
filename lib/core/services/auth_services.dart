// auth_service.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:laborus_app/core/data/auth_database.dart';
import 'package:laborus_app/core/exceptions/auth_exception.dart';
import 'package:laborus_app/core/exceptions/signup_exception.dart';
import 'package:laborus_app/core/model/responses/auth_response.dart';
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

  String _imageToBase64(File? imageFile) {
    if (imageFile == null) return '';
    List<int> imageBytes = imageFile.readAsBytesSync();
    return base64Encode(imageBytes);
  }

  Future<Map<String, dynamic>> signup(
    UserModel user, {
    File? profileImageFile,
    File? bannerImageFile,
  }) async {
    try {
      // Convert images to base64
      final profileImageBase64 = _imageToBase64(profileImageFile);
      final bannerImageBase64 = _imageToBase64(bannerImageFile);

      // Create user data with base64 images
      final userData = user.toJson();
      userData['profileImage'] = profileImageBase64;
      userData['bannerImage'] = bannerImageBase64;

      final response = await http.post(
        Uri.parse('$_baseUrl/api/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }

      final error = json.decode(response.body);
      throw SignupException(
        error['message'] ?? 'Erro ao criar conta',
        code: error['code'],
        details: error['details'],
      );
    } catch (e) {
      print('Erro ao criar conta; $e');
      if (e is SignupException) rethrow;

      throw SignupException('Erro ao criar conta: ${e.toString()}');
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
