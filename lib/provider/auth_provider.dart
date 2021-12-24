// ignore_for_file: avoid_print

import 'package:clover/model/user_model.dart';
import 'package:clover/services/auth_services.dart';
import 'package:flutter/widgets.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  // REGISTER FUNCTION IN HERE
  Future<bool?> register({
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel? user = await AuthServices().register(
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // LOGIN FUNCTION IN HERE
  Future<bool?> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel? user = await AuthServices().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
