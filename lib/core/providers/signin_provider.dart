import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laborus_app/core/exceptions/auth_exception.dart';
import 'package:laborus_app/core/services/auth_services.dart';

class SigninProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> signIn(String email, String password) async {
    try {
      _error = null;
      _isLoading = true;
      notifyListeners();

      await _authService.signIn(email, password);

      return true;
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
}
