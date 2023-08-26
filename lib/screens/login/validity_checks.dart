import "package:awashyak_v1/widgets/toast_notifications.dart";
import "package:flutter/material.dart";

class SignUpCheck {
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;
  final TextEditingController _mobileController;
  bool _hasError = false;

  SignUpCheck(
    this._passwordController,
    this._confirmPasswordController,
    this._mobileController,
  );

  bool passwordIdentityCheck() {
    if (_passwordController.text == _confirmPasswordController.text) {
      return true;
    } else {
      showNotification("Passwords do not match!");
      return false;
    }
  }

  bool mobileCheck() {
    try {
      _hasError = false;
      double.parse(_mobileController.text);
    } on FormatException {
      _hasError = true;
    }
    if (_hasError == false && _mobileController.text.length == 10) {
      return true;
    } else {
      showNotification("Please Enter Valid Mobile Number");
      return false;
    }
  }

  bool minCharacterCheck(int l, TextEditingController text) {
    if (text.text.length < l) {
      showNotification("Field must contain $l characters.");
      return false;
    } else {
      return true;
    }
  }
}
