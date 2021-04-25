import 'package:flutter/cupertino.dart';

class AuraUser {
  final String userID;

  Map<String, dynamic> toMap() {
    return {
      'UserID': userID,
    };
  }

  AuraUser({@required this.userID});
}
