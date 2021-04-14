import 'package:aura_chat/Screens/Login/components/body.dart';
import 'package:aura_chat/viewmodels/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);

    if (_userViewModel.user != null) {
      Navigator.of(context).pop();
    }
    return Scaffold(
      body: _userViewModel.state == ViewState.Idle
          ? Body()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
