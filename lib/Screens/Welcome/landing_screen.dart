import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/screens/Home/home_screen.dart';
import 'package:aura_chat/screens/SignUp/signup_screen.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:aura_chat/services/firebase_auth_service.dart';
import 'package:aura_chat/services/locator.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  AuraUser _user;

  AuthBase authService = locator<FirebaseAuthService>();
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignUpScreen(
        onSignIn: (user) {
          _updateUser(user);
        },
      );
    } else {
      return HomeScreen(
        user: _user,
        onSignOut: (user) {
          _updateUser(user);
        },
      );
    }
  }

  Future<void> _checkUser() async {
    _user = await authService.currentUser();
  }

  void _updateUser(AuraUser user) {
    setState(() {
      _user = user;
    });
  }
}
