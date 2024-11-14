import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:laborus_app/core/model/users/school_model.dart';
import 'package:laborus_app/core/model/users/user_modell.dart';
import 'package:laborus_app/core/services/auth_services.dart';

class SignupProvider with ChangeNotifier {
  final AuthService _apiService = AuthService();

  String _name = '';
  String _email = '';
  String _password = '';
  String _cpf = '';
  String _school = '';
  String _course = '';
  List<String> _tags = [];
  String _aboutContent = '';
  File? _profileImage;
  File? _bannerImage;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get cpf => _cpf;
  String get school => _school;
  String get course => _course;
  List<String> get tags => _tags;
  String get aboutContent => _aboutContent;
  File? get profileImage => _profileImage;
  File? get bannerImage => _bannerImage;

  String? _schoolError;
  String? _courseError;
  File? _profileImageFile;
  File? _bannerImageFile;

  String? get schoolError => _schoolError;
  String? get courseError => _courseError;
  File? get profileImageFile => _profileImageFile;
  File? get bannerImageFile => _bannerImageFile;

  void setSchool(String value) {
    _school = value;
    _schoolError = null;
    notifyListeners();
  }

  void setCourse(String value) {
    _course = value;
    _courseError = null;
    notifyListeners();
  }

  void setProfileImage(File file) {
    _profileImageFile = file;
    notifyListeners();
  }

  void setBannerImage(File file) {
    _bannerImageFile = file;
    notifyListeners();
  }

  bool validateInstitutionStep() {
    bool isValid = true;

    if (_school.isEmpty) {
      _schoolError = 'Selecione uma instituição';
      isValid = false;
    }

    if (_course.isEmpty) {
      _courseError = 'Selecione um curso';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  Future<void> refreshSchools() async {
    notifyListeners();
  }

  // Setters with notifyListeners
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setCpf(String value) {
    _cpf = value;
    notifyListeners();
  }

  void setTags(List<String> value) {
    _tags = value;
    notifyListeners();
  }

  void setAboutContent(String value) {
    _aboutContent = value;
    notifyListeners();
  }

  Future<String> _imageToBase64(File image) async {
    List<int> imageBytes = await image.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<bool> signup() async {
    try {
      if (!validateInstitutionStep()) {
        return false;
      }

      final user = UserModel(
        name: name,
        email: email,
        password: password,
        cpf: cpf,
        school: school,
        course: course,
        tags: tags,
        aboutContent: aboutContent,
      );

      await _apiService.signup(
        user,
        profileImageFile: _profileImageFile,
        bannerImageFile: _bannerImageFile,
      );

      return true;
    } catch (e) {
      // _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<List<SchoolModel>> getSchools() async {
    return await _apiService.getSchools();
  }

  void reset() {
    _name = '';
    _email = '';
    _password = '';
    _cpf = '';
    _school = '';
    _course = '';
    _tags = [];
    _aboutContent = '';
    _profileImage = null;
    _bannerImage = null;
    notifyListeners();
  }
}
