// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:clover/model/user_model.dart';
import 'package:clover/model/verify_model.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  String baseUrl = 'https://dev-api-clover.herokuapp.com/api';

  // REGISTER FUNCTION
  Future<UserModel?> register({
    String? username,
    String? email,
    String? password,
    String? otp,
  }) async {
    var url = Uri.parse('$baseUrl/register/mobile');
    var header = {
      'Content-Type': 'application/json',
      'Origin': 'https://clover-web-b7d402pby-frhnmubarok.vercel.app'
    };
    var body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'email_otp': otp,
    });

    var response = await https.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']);
      user.token = data['token'];
      await saveToken(user.token!, user.username!, user.email!);
      return user;
    } else {
      print(response.statusCode);
      throw Exception('Gagal register !');
    }
  }

// verif email
  Future<VerifyModel> verifyEmail({
    String? email,
    String? otp,
  }) async {
    var url = Uri.parse('$baseUrl/confirm-mobile-otp');
    var header = {
      'Content-Type': 'application/json',
      'Origin': 'https://clover-web-b7d402pby-frhnmubarok.vercel.app'
    };
    var body = jsonEncode({
      'otp': otp,
      'email': email,
    });

    var response = await https.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      VerifyModel verify = VerifyModel.fromJson(data);
      verify.otp = data['otp'];

      return verify;
    } else {
      print(response.statusCode);
      throw Exception('gagal verif !');
    }
  }

  // LOGIN FUNCTION
  Future<UserModel?> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var header = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Origin': 'https://clover-web-b7d402pby-frhnmubarok.vercel.app'
    };

    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await https.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['data']);
      user.token = data['token'];
      await saveToken(user.token!, user.username, user.email);
      return user;
    } else {
      throw Exception('Gagal Login !');
    }
  }

  saveToken(String token, username, email) async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  getToken() async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getString('token');
    return result;
  }

  removeToken() async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
