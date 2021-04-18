import 'package:aura_chat/validations/validation_item.dart';
import 'package:flutter/cupertino.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  //Getters
  ValidationItem get email => _email;
  ValidationItem get password => _password;
  bool get isValid {
    if (_email.value != null && _password.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void checkValidEmail(String value) {
    if (value != "") {
      bool _emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (_emailValid) {
        _email = ValidationItem(value, null);
      } else {
        _email = ValidationItem(null, "Please, Enter Valid E-mail Address");
      }
    } else {
      _email = ValidationItem(null, null);
    }
    notifyListeners();
  }

  void checkValidPassword(String value) {
    if (value != "") {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = new RegExp(pattern);
      bool _validPassword = regExp.hasMatch(value);
      if (_validPassword) {
        _password = ValidationItem(value, null);
      } else if (!_validPassword) {
        _password = ValidationItem(null,
            "Password must have upper and lower case letters, at least 1 number");
      }
    } else {
      _password = ValidationItem(null, null);
    }
    notifyListeners();
  }
}
