import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laborus_app/core/exceptions/auth_exception.dart';
import 'package:laborus_app/core/services/auth_services.dart';

class SigninProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;
  bool _isLoading = false;
  Map<String, dynamic>? _userData;
  String? _token;
  String? _error;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  Map<String, dynamic>? get userData => _userData;
  String? get token => _token;
  String? get error => _error;

  Future<bool> signIn(String email, String password) async {
    try {
      _error = null;
      _isLoading = true;
      notifyListeners();

      final result = await _authService.signIn(email, password);

      if (result['success'] == true && result['userData'] != null) {
        _userData = result['userData'];

        return true;
      }

      _error = 'Falha na autenticação';
      return false;
    } on AuthException catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = 'Ocorreu um erro inesperado';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading = true;
      notifyListeners();
      await _authService.signOut();
      _isAuthenticated = false;
      _userData = null;
      _token = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
