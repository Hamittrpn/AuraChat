import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:aura_chat/services/fake_auth_service.dart';
import 'package:aura_chat/services/firebase_auth_service.dart';
import 'package:aura_chat/services/firestore_db_service.dart';
import 'package:aura_chat/services/locator.dart';

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FakeAuthService _fakeAuthService = locator<FakeAuthService>();
  FirestoreDbService _firestoreDbService = locator<FirestoreDbService>();

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

  @override
  Future<AuraUser> signInWithGoogle() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithGoogle();
    } else {
      return await _firebaseAuthService.signInWithGoogle();
    }
  }

  @override
  Future<AuraUser> signInWithFacebook() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithFacebook();
    } else {
      return await _firebaseAuthService.signInWithFacebook();
    }
  }

  @override
  Future<AuraUser> createUserWithEmail(String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.createUserWithEmail(email, password);
    } else {
      AuraUser _user =
          await _firebaseAuthService.createUserWithEmail(email, password);
      bool result = await _firestoreDbService.saveUser(_user);
      if (result) {
        return _user;
      } else {
        return null;
      }
    }
  }

  @override
  Future<AuraUser> signInWithEmail(String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthService.signInWithEmail(email, password);
    } else {
      return await _firebaseAuthService.signInWithEmail(email, password);
    }
  }
}
