import 'package:aura_chat/models/user_model.dart';

abstract class DBBase {
  Future<bool> saveUser(AuraUser user);
}
