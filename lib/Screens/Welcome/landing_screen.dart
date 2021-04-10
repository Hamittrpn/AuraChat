import 'package:aura_chat/screens/Home/home_screen.dart';
import 'package:aura_chat/screens/SignUp/signup_screen.dart';
import 'package:aura_chat/viewmodels/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.state == ViewState.Idle) {
      if (_userViewModel.user == null) {
        return SignUpScreen();
      } else {
        return HomeScreen(
          user: _userViewModel.user,
        );
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
