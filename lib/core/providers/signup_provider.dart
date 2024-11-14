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

  void setSchool(String value) {
    _school = value;
    notifyListeners();
  }

  void setCourse(String value) {
    _course = value;
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

  void setProfileImage(File value) {
    _profileImage = value;
    notifyListeners();
  }

  void setBannerImage(File value) {
    _bannerImage = value;
    notifyListeners();
  }

  Future<String> _imageToBase64(File image) async {
    List<int> imageBytes = await image.readAsBytes();
    return base64Encode(imageBytes);
  }

  Future<bool> submitSignup() async {
    try {
      String? profileImageBase64;
      String? bannerImageBase64;

      if (_profileImage != null) {
        profileImageBase64 = await _imageToBase64(_profileImage!);
      }

      if (_bannerImage != null) {
        bannerImageBase64 = await _imageToBase64(_bannerImage!);
      }

      final user = UserModel(
        name: _name,
        email: _email,
        password: _password,
        cpf: _cpf,
        school: _school,
        course: _course,
        tags: _tags,
        profileImage: profileImageBase64,
        bannerImage: bannerImageBase64,
        aboutContent: _aboutContent,
      );

      final response = await _apiService.signup(user);
      return response['success'] ?? false;
    } catch (e) {
      print('Error during signup: $e');
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
