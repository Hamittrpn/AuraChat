import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:aura_chat/services/fake_auth_service.dart';
import 'package:aura_chat/services/firebase_auth_service.dart';
import 'package:aura_chat/services/locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService = locator<FakeAuthService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<AuraUser> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.currentUser();
    } else {
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<AuraUser> signInAnonymusly() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInAnonymusly();
    } else {
      return await _firebaseAuthService.signInAnonymusly();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }
}
