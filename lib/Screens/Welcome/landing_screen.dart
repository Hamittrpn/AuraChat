import 'package:aura_chat/Models/user_model.dart';
import 'package:aura_chat/Screens/Home/home_screen.dart';
import 'package:aura_chat/Screens/Login/login_screen.dart';
import 'package:aura_chat/Screens/SignUp/signup_screen.dart';
import 'package:aura_chat/Services/auth_base.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  final AuthBase authService;
  const LandingScreen({@required this.authService});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  AuraUser _user;

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignUpScreen(
        authService: widget.authService,
      );
    } else {
      return HomeScreen(authService: widget.authService);
    }
  }

  Future<void> _checkUser() async {
    _user = await widget.authService.currentUser();
  }
}
