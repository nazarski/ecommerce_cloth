import 'dart:developer';

import 'package:flutter/cupertino.dart';



String validatePasswordHelper(String? password) {
  if (password!.isEmpty) {
    return 'This field is required and cannot be empty';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters';
  }
  return '';
}

String validateUserNameHelper(String? userName) {
  return userName!.isEmpty || userName.length > 15 ? 'Please enter a correct username' : '';
}

bool validateAndSaveUserHelper({required GlobalKey<FormState> formKey}) {
  final FormState form = formKey.currentState!;
  if (form.validate()) {
    log('Form is valid');
  } else {
    log('Form is invalid');
  }
  return form.validate();
}

bool validateAndSaveHelper({required GlobalKey<FormState> formKey}) {
  final FormState? form = formKey.currentState;
  if (form != null && form.validate()) {
    log('Form is valid');
    return true;
  } else {
    log('Form is invalid');
    return false;
  }
}