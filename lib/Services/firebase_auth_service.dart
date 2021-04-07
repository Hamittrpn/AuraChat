import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<AuraUser> currentUser() async {
    try {
      final User user = auth.currentUser;
      return _userFromFirebase(user);
    } catch (e) {
      print("ERROR CURRENT USER" + e.toString());
      return null;
    }
  }

  @override
  Future<AuraUser> signInAnonymusly() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      print("ERROR SIGN IN ANONYMOUSLY" + e.toString());
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      print("ERROR SIGN OUT" + e.toString());
      return false;
    }
  }

  AuraUser _userFromFirebase(User user) {
    if (user == null) return null;
    return AuraUser(userID: user.uid);
  }
}
