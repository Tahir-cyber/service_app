import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../Enums/enums.dart';

import 'package:firebase_auth/firebase_auth.dart';

class BaseViewModal extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  Customsetsate(Function calling, String value) {
    calling;
    value;
    notifyListeners();
  }
}

class CustomAuthResult {
  bool? status;
  String? errorMessage;
  User? user;

  CustomAuthResult({this.status, this.errorMessage, this.user});
}

//auth expations

class AuthExceptionsService {
  static generateExceptionMessage(e) {
    print('E.code: ${e.code}');
    String errorMessage;
    switch (e.code) {
      case "email-already-in-use":
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      case "invalid-email":
        errorMessage = "Your email address appears to be malformed.";
        break;
      case "weak-password":
        errorMessage =
            "Your password is very weak. Please try a strong password.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "user-disabled":
        errorMessage = "User with this email has been disabled.";
        break;
      case "operation-not-allowed":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;

      //Todo: Handle no internet exception as well.

      default:
        errorMessage = "An undefined Error happened.";
    }
    return errorMessage;
  }
}
