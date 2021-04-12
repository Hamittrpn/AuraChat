import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AuraUser> currentUser() async {
    try {
      final User user = _firebaseAuth.currentUser;
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
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
      final _facebookLogin = FacebookLogin();
      await _facebookLogin.logOut();

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

  @override
  Future<AuraUser> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount _googleUser = await _googleSignIn.signIn();

    if (_googleUser != null) {
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      if (_googleAuth.idToken != null && _googleAuth.accessToken != null) {
        UserCredential result = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: _googleAuth.idToken,
                accessToken: _googleAuth.accessToken));
        User _user = result.user;
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Future<AuraUser> signInWithFacebook() async {
    final _facebookLogin = FacebookLogin();

    FacebookLoginResult _faceResult =
        await _facebookLogin.logIn(['public_profile', 'email']);
    switch (_faceResult.status) {
      case FacebookLoginStatus.loggedIn:
        if (_faceResult.accessToken != null) {
          UserCredential _firebaseResult = await _firebaseAuth
              .signInWithCredential(FacebookAuthProvider.credential(
                  _faceResult.accessToken.token));
          User _user = _firebaseResult.user;
          return _userFromFirebase(_user);
        }
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Kullanıcı girişi iptal etti");
        break;
      case FacebookLoginStatus.error:
        print("Hata çıktı: " + _faceResult.errorMessage);
        break;
    }
    return null;
  }
}
