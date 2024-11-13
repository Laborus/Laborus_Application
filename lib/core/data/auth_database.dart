import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthDatabase {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _tokenExpiryKey = 'token_expiry';

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

  Future<void> saveTokenExpiryDate(DateTime expiryDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenExpiryKey, expiryDate.toIso8601String());
  }

  Future<DateTime?> getTokenExpiryDate() async {
    final prefs = await SharedPreferences.getInstance();
    final expiryDateStr = prefs.getString(_tokenExpiryKey);
    if (expiryDateStr != null) {
      return DateTime.parse(expiryDateStr);
    }
    return null;
  }

  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
    await prefs.remove(_tokenExpiryKey);
  }
}
