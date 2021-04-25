import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';

class FakeAuthService implements AuthBase {
  String userID = "0871235491274";
  @override
  Future<AuraUser> currentUser() async {
    return await Future.value(AuraUser(userID: userID));
  }

  @override
  Future<AuraUser> signInAnonymusly() async {
    return await Future.delayed(
        Duration(seconds: 2), () => AuraUser(userID: userID));
  }

  @override
  Future<bool> signOut() async {
    return await Future.value(true);
  }

  @override
  Future<AuraUser> signInWithGoogle() async {
    return await Future.delayed(
        Duration(seconds: 2), () => AuraUser(userID: "google_user_id_489476"));
  }

  @override
  Future<AuraUser> signInWithFacebook() async {
    return await Future.delayed(Duration(seconds: 2),
        () => AuraUser(userID: "facebook_user_id_489476"));
  }

  @override
  Future<AuraUser> createUserWithEmail(String email, String password) async {
    return await Future.delayed(
        Duration(seconds: 2), () => AuraUser(userID: "email_user_id_489476"));
  }

  @override
  Future<AuraUser> signInWithEmail(String email, String password) async {
    return await Future.delayed(
        Duration(seconds: 2), () => AuraUser(userID: "email_user_id_12476"));
  }
}
