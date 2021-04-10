import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/viewmodels/user_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuraUser user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
        actions: [
          TextButton(
            onPressed: () => _signOut(context),
            child: Text(
              "LogOut",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Welcome" + user.userID.toString(),
        ),
      ),
    );
  }

  Future<bool> _signOut(BuildContext context) async {
    final _userViewModel = Provider.of<UserViewModel>(context, listen: false);
    bool result = await _userViewModel.signOut();
    return result;
  }
}
