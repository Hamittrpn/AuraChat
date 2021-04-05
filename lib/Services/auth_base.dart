import 'package:aura_chat/Models/user_model.dart';

abstract class AuthBase {
  Future<AuraUser> currentUser();
  Future<AuraUser> signInAnonymusly();
  Future<bool> signOut();
}
