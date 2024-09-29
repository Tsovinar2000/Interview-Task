import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:interview_task_project/models/auth_model.dart';
import 'package:interview_task_project/util/enums.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../service/remote_repository/firebase_auth_repo.dart';
import '../service/remote_repository/firebase_repo.dart';

class AuthViewModelProvider extends ChangeNotifier {
  ExecutionState executionState = ExecutionState.initial;
  final firebasAuthRepo = FirebaseAuthRepoImpl();

  FormGroup loginForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
    'recovery_code':
        FormControl<String>(validators: [Validators.required], value: ''),
    'confirm_password':
        FormControl<String>(validators: [Validators.required], value: ''),
    'validate': FormControl<bool>(value: false),
  });

  FormGroup registerForm = FormGroup(
    {
      'name': FormControl<String>(
        validators: [Validators.required],
      ),
      'lastName': FormControl<String>(
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        validators: [Validators.required],
      ),
      'country_code': FormControl<String>(
        validators: [Validators.required],
      ),
      'phone': FormControl<String>(
        validators: [Validators.required],
      ),
      'country': FormControl<String>(
        validators: [Validators.required],
      ),
      'region': FormControl<String>(
        validators: [Validators.required],
      ),
      'cityVillage': FormControl<String>(
        validators: [Validators.required],
      ),
      'school': FormControl<String>(
        validators: [Validators.required],
      ),
      'subject': FormControl<List<String>>(
        validators: [Validators.required],
      ),
      'grade': FormControl<String>(
        validators: [Validators.required],
      ),
      'password': FormControl<String>(
        validators: [Validators.required],
      ),
      'confirmPassword': FormControl<String>(
        validators: [Validators.required],
      ),
      'validate': FormControl<bool>(value: false),
      'type': FormControl<String>(validators: [Validators.required], value: ''),
      'id': FormControl<String>(validators: [Validators.required], value: ''),
    },
  );

  void setFakeValuesToDonor() {
    registerForm.control('school').value = 'Value 1';
    registerForm.control('subject').value = ['Value 2'];

    registerForm.control('grade').value = 'Value 3';
    registerForm.control('type').value = 'Value 1';
    registerForm.control('id').value = 'Value 2';

    notifyListeners();
  }

  void setFakeValuesToTeacher() {
    registerForm.control('type').value = 'Value 1';
    registerForm.control('id').value = 'Value 2';

    notifyListeners();
  }

  void changeValidationStatus(bool val) {
    registerForm.control('validate').value = val;
    loginForm.control('validate').value = val;
    notifyListeners();
  }

  void resetForms() {
    registerForm.reset();
    loginForm.reset();
    notifyListeners();
  }

  void submitLoginForm() async {
    if (loginForm.control('email').valid &&
        loginForm.control('password').valid) {
      executionState = ExecutionState.loading;
      var response = await firebasAuthRepo
          .signIn(SignInModel.fromJson(registerForm.value));
      executionState = ExecutionState.ready;
      if (FirebaseService.firebaseAuth.currentUser != null) {
        resetForms();
      }

      log(response.toString());
    } else {
      loginForm.markAllAsTouched();
    }
    notifyListeners();
  }

  Future<void> submitRegisterForm() async {
    log(SignUpModel.fromJson(registerForm.value).toString());
    if (registerForm.valid) {
      executionState = ExecutionState.loading;
      var response = await firebasAuthRepo
          .signUp(SignUpModel.fromJson(registerForm.value));
      executionState = ExecutionState.ready;

      log(response.toString());
    } else {
      registerForm.markAllAsTouched();
    }
    notifyListeners();
  }
}
