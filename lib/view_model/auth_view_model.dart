import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AuthViewModelProvider extends ChangeNotifier {
  FormGroup loginForm = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
    'recovery_code': FormControl<String>(validators: [Validators.required]),
    'confirm_password': FormControl<String>(validators: [Validators.required]),
    'validate': FormControl<bool>(value: false),
  });

  FormGroup registerForm = FormGroup(
    {
      'name': FormControl<String>(validators: [Validators.required]),
      'surname': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(validators: [Validators.required]),
      'country_code': FormControl<String>(validators: [Validators.required]),
      'phone_number': FormControl<String>(validators: [Validators.required]),
      'country': FormControl<String>(validators: [Validators.required]),
      'region_state': FormControl<String>(validators: [Validators.required]),
      'city': FormControl<String>(validators: [Validators.required]),
      'school': FormControl<String>(validators: [Validators.required]),
      'subject': FormControl<List<String>>(validators: [Validators.required]),
      'grade': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [Validators.required]),
      'confirm_password':
          FormControl<String>(validators: [Validators.required]),
      'validate': FormControl<bool>(value: false),
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

  void submitRegisterForm() {
    if (registerForm.valid) {
      print(
          'Register form submitted with email: ${registerForm.control('email').value}');
    } else {
      registerForm.markAllAsTouched();
    }
  }
}
