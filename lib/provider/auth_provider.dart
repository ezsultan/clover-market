// ignore_for_file: avoid_print

import 'package:clover/model/user_model.dart';
import 'package:clover/model/verify_model.dart';
import 'package:clover/services/auth_services.dart';
import 'package:flutter/widgets.dart';

class AuthProvider with ChangeNotifier {
  UserModel? token = UserModel();
  VerifyModel? _verify;
  VerifyModel? get verify => _verify;
  UserModel? _user;
  UserModel? get user => _user;

  set verify(VerifyModel? user) {
    _verify = verify;
    notifyListeners();
  }

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  // REGISTER FUNCTION IN HERE
  Future<bool?> register({
    String? username,
    String? email,
    String? password,
    String? otp,
  }) async {
    try {
      UserModel? user = await AuthServices().register(
        username: username,
        email: email,
        password: password,
        otp: otp,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

// otp verify in here
  Future<bool?> otpVerify({
    String? otp,
    String? email,
  }) async {
    try {
      VerifyModel? verify = await AuthServices().verifyEmail(
        email: email,
        otp: otp,
      );

      _verify = verify;
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

  Future<bool> checkToken() async {
    final result = await AuthServices().getToken();
    token!.token = result;
    if (result == null) {
      return false;
    } else {
      return true;
    }
  }
}
