import 'package:flutter/material.dart';
import 'dart:io';
import 'package:laborus_app/core/model/users/school_model.dart';
import 'package:laborus_app/core/model/users/user_modell.dart';
import 'package:laborus_app/core/services/auth_services.dart';

enum SignupStep { details, profile, institution }

class SignupProvider with ChangeNotifier {
  final AuthService _apiService = AuthService();

  // Form data
  String _name = '';
  String _email = '';
  String _password = '';
  String _cpf = '';
  String _school = '';
  String _course = '';
  // List<String> _tags = [];
  String _aboutContent = '';
  File? _profileImageFile;
  File? _bannerImageFile;

  // Error states
  Map<String, String?> _errors = {
    'name': null,
    'email': null,
    'password': null,
    'cpf': null,
    'school': null,
    'course': null,
    'about': null,
    // 'tags': null,
  };

  // Loading states
  bool _isLoading = false;
  String? _loadingMessage;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get cpf => _cpf;
  String get school => _school;
  String get course => _course;
  // List<String> get tags => _tags;
  String get aboutContent => _aboutContent;
  File? get profileImageFile => _profileImageFile;
  File? get bannerImageFile => _bannerImageFile;
  bool get isLoading => _isLoading;
  String? get loadingMessage => _loadingMessage;
  Map<String, String?> get errors => _errors;

  // Validation methods for each step
  bool validateDetailsStep() {
    bool isValid = true;

    if (_name.isEmpty) {
      _errors['name'] = 'Nome é obrigatório';
      isValid = false;
    }

    if (_email.isEmpty) {
      _errors['email'] = 'Email é obrigatório';
      isValid = false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email)) {
      _errors['email'] = 'Email inválido';
      isValid = false;
    }

    if (_cpf.isEmpty) {
      _errors['cpf'] = 'CPF é obrigatório';
      isValid = false;
    } else if (!_isValidCPF(_cpf)) {
      _errors['cpf'] = 'CPF inválido';
      isValid = false;
    }

    if (_password.isEmpty) {
      _errors['password'] = 'Senha é obrigatória';
      isValid = false;
    } else if (_password.length < 6) {
      _errors['password'] = 'Senha deve ter no mínimo 6 caracteres';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  bool validateProfileStep() {
    bool isValid = true;

    if (_aboutContent.isEmpty) {
      _errors['about'] = 'Descrição é obrigatória';
      isValid = false;
    }

    // if (_tags.isEmpty) {
    //   _errors['tags'] = 'Selecione pelo menos uma tag';
    //   isValid = false;
    // }

    // Optional validation for images
    if (_profileImageFile == null) {
      _errors['profileImage'] = 'Selecione uma foto de perfil';
      // Not blocking validation, just warning
    }

    if (_bannerImageFile == null) {
      _errors['bannerImage'] = 'Selecione uma foto de capa';
      // Not blocking validation, just warning
    }

    notifyListeners();
    return isValid;
  }

  bool validateInstitutionStep() {
    bool isValid = true;

    if (_school.isEmpty) {
      _errors['school'] = 'Selecione uma instituição';
      isValid = false;
    }

    if (_course.isEmpty) {
      _errors['course'] = 'Selecione um curso';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  // Setters with error clearing
  void setName(String value) {
    _name = value;
    _errors['name'] = null;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    _errors['email'] = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    _errors['password'] = null;
    notifyListeners();
  }

  void setCpf(String value) {
    _cpf = value;
    _errors['cpf'] = null;
    notifyListeners();
  }

  void setSchool(String value) {
    _school = value;
    _errors['school'] = null;
    notifyListeners();
  }

  void setCourse(String value) {
    _course = value;
    _errors['course'] = null;
    notifyListeners();
  }

  void setAboutContent(String value) {
    _aboutContent = value;
    _errors['about'] = null;
    notifyListeners();
  }

  void setProfileImage(File file) {
    _profileImageFile = file;
    _errors['profileImage'] = null;
    notifyListeners();
  }

  void setBannerImage(File file) {
    _bannerImageFile = file;
    _errors['bannerImage'] = null;
    notifyListeners();
  }

  // // Tag management with improved state handling
  // void addTag(String tag) {
  //   print(_tags.toString() + ' ' + tag);
  //   if (_tags.length < 3 && !_tags.contains(tag)) {
  //     _tags = List.from(_tags)
  //       ..add(tag); // Create new list to ensure state update
  //     _errors['tags'] = null;
  //     notifyListeners();
  //   }
  // }

  // void removeTag(String tag) {
  //   _tags = List.from(_tags)
  //     ..remove(tag); // Create new list to ensure state update
  //   if (_tags.isEmpty) {
  //     _errors['tags'] = 'Selecione pelo menos uma tag';
  //   }
  //   notifyListeners();
  // }

  // API methods with error handling

  Future<List<SchoolModel>> getSchools() async {
    try {
      final schools = await _apiService.getSchools();
      return schools;
    } catch (e) {
      print('Erro ao carregar escolas: $e'); // Para debug
      throw Exception('Falha ao carregar instituições: ${e.toString()}');
    }
  }

  Future<bool> signup() async {
    try {
      // Validate all steps before proceeding
      if (!validateDetailsStep() ||
          !validateProfileStep() ||
          !validateInstitutionStep()) {
        return false;
      }

      _isLoading = true;
      _loadingMessage = 'Criando conta...';
      notifyListeners();

      final user = UserModel(
        name: _name,
        email: _email,
        password: _password,
        cpf: _cpf,
        school: _school,
        course: _course,
        // tags: _tags,
        aboutContent: _aboutContent,
      );

      await _apiService.signup(
        user,
        profileImageFile: _profileImageFile,
        bannerImageFile: _bannerImageFile,
      );

      _isLoading = false;
      _loadingMessage = null;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _loadingMessage = null;
      _errors['submit'] = e.toString();
      notifyListeners();
      return false;
    }
  }

  // Helper methods
  bool _isValidCPF(String cpf) {
    // Remove non-digits
    cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    // Check length
    if (cpf.length != 11) return false;

    // Check if all digits are the same
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

    // Calculate first digit
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int digit1 = 11 - (sum % 11);
    if (digit1 > 9) digit1 = 0;

    // Calculate second digit
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    int digit2 = 11 - (sum % 11);
    if (digit2 > 9) digit2 = 0;

    // Check if calculated digits match the actual ones
    return cpf[9] == digit1.toString() && cpf[10] == digit2.toString();
  }

  void reset() {
    _name = '';
    _email = '';
    _password = '';
    _cpf = '';
    _school = '';
    _course = '';
    // _tags = [];
    _aboutContent = '';
    _profileImageFile = null;
    _bannerImageFile = null;
    _errors = {};
    _isLoading = false;
    _loadingMessage = null;
    notifyListeners();
  }
}
