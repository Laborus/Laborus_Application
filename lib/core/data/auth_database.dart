import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDatabase {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _userIdKey =
      'user_id'; // Nova chave para armazenar o ID do usuário

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();

    // Salva o ID do usuário separadamente
    if (userData.containsKey('id')) {
      await prefs.setString(_userIdKey, userData['id'].toString());
    }

    // Salva todos os outros dados do usuário
    await prefs.setString(_userKey, jsonEncode(userData));
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(_userKey);

    if (userDataString != null) {
      return jsonDecode(userDataString) as Map<String, dynamic>;
    }
    return null;
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<Map<String, dynamic>?> validateToken() async {
    final token = await getToken();

    if (token != null) {
      try {
        final response = await http.get(
          Uri.parse('/api/validate-token'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final responseData =
              jsonDecode(response.body) as Map<String, dynamic>;

          if (responseData['success'] == true) {
            final userData = {
              'id': responseData['user']['id'],
              'tokenInfo': responseData['tokenInfo'],
            };

            // Salva o ID separadamente e o resto dos dados do usuário
            await saveUserData(userData);
            return userData;
          } else {
            await clearAuthData();
            return null;
          }
        }
      } catch (e) {
        await clearAuthData();
        return null;
      }
    } else {
      return null;
    }
    return null;
  }

  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_userIdKey); // Remove o ID do usuário ao limpar os dados
  }

  Future<bool> isTokenValid() async {
    final userData = await validateToken();
    return userData != null;
  }
}
