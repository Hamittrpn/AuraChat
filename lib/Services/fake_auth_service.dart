import 'package:aura_chat/Models/user_model.dart';
import 'package:aura_chat/Services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "0871235491274";
  @override
  Future<AuraUser> currentUser() async {
    return await Future.value(AuraUser(UserID: userID));
  }

  @override
  Future<AuraUser> signInAnonymusly() async {
    return await Future.delayed(
        Duration(seconds: 2), () => AuraUser(UserID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }
}
