import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:interview_task_project/models/auth_model.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../service/remote_repository/firebase_auth_repo.dart';

class AuthViewModelProvider extends ChangeNotifier {
  final firebasAuthRepo = FirebaseAuthRepoImpl();

  FormGroup loginForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
    'recovery_code': FormControl<String>(validators: [Validators.required]),
    'confirm_password': FormControl<String>(validators: [Validators.required]),
    'validate': FormControl<bool>(value: false),
  });

  FormGroup registerForm = FormGroup(
    {
      'name': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'lastName': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'email': FormControl<String>(
          validators: [Validators.required], value: 'value2@mailinator.com'),
      'country_code': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'phone': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'country': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'region': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'cityVillage': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'school': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'subject': FormControl<List<String>>(
          validators: [Validators.required], value: ['Value 1']),
      'grade': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'password': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'confirmPassword': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'validate': FormControl<bool>(value: false),
      'verifyCode': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'type': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
      'id': FormControl<String>(
          validators: [Validators.required], value: 'Value 1'),
    },
  );

  void changeValidationStatus(bool val) {
    registerForm.control('validate').value = val;
    loginForm.control('validate').value = val;
    notifyListeners();
  }

  void submitLoginForm() {
    if (loginForm.valid) {
      print(
          'Login form submitted with email: ${loginForm.control('email').value}');
    } else {
      loginForm
          .markAllAsTouched(); // Mark the form as touched so validation messages appear
    }
  }

  void submitRegisterForm() async {
    log(SignUpModel.fromJson(registerForm.value).toString());
    if (registerForm.valid) {
      var response = await firebasAuthRepo
          .signUp(SignUpModel.fromJson(registerForm.value));

      log(response.toString());
    } else {
      registerForm.markAllAsTouched();
    }
  }
}
