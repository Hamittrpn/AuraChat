import 'package:aura_chat/models/user_model.dart';

abstract class AuthBase {
  Future<AuraUser> currentUser();
  Future<AuraUser> signInAnonymusly();
  Future<bool> signOut();
  Future<AuraUser> signInWithGoogle();
  Future<AuraUser> signInWithFacebook();
}
