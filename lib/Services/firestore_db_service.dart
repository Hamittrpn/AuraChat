import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/services/db_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(AuraUser user) async {
    await _firestore.collection("users").doc(user.userID).set(user.toMap());
    DocumentSnapshot _readUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    Map _readUserInfoToMap = _readUser.data();
    AuraUser _readUserObject = AuraUser.fromMap(_readUserInfoToMap);
    return true;
  }
}
