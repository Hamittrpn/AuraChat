import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:aura_chat/services/firebase_auth_service.dart';
import 'package:aura_chat/services/locator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function onSignOut;
  final AuraUser user;
  AuthBase authService = locator<FirebaseAuthService>();

  HomeScreen({@required this.onSignOut, @required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }

  Future<bool> signOut() async {
    return await authService.signOut();
  }
}
