import 'package:aura_chat/Services/auth_base.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthBase authService;

  HomeScreen({@required this.authService});

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

  Future<bool> _signOut() async {
    return await authService.signOut();
  }
}
