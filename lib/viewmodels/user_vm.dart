import 'package:aura_chat/models/user_model.dart';
import 'package:aura_chat/repository/user_repository.dart';
import 'package:aura_chat/services/auth_base.dart';
import 'package:aura_chat/services/locator.dart';
import 'package:flutter/cupertino.dart';

enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  AuraUser _user;

  ViewState get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserViewModel() {
    currentUser();
  }

  AuraUser get user => _user;

  @override
  Future<AuraUser> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("ViewModel Current User Hatası : " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<AuraUser> signInAnonymusly() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.signInAnonymusly();
      return _user;
    } catch (e) {
      debugPrint("ViewModel Current User Hatası : " + e.toString());
      return null;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      bool result = await _userRepository.signOut();
      _user = null;
      return result;
    } catch (e) {
      debugPrint("ViewModel Current User Hatası : " + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
