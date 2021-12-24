// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:clover/model/user_model.dart';
import 'package:http/http.dart' as https;

class AuthServices {
  String baseUrl = 'https://api-clover.herokuapp.com/api';

  // REGISTER FUNCTION
  Future<UserModel?> register({
    String? username,
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/register');

    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    var body = jsonEncode({
      'username': username,
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

      return user;
    } else {
      throw Exception('Gagal register !');
    }
  }

  // LOGIN FUNCTION
  Future<UserModel?> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var header = {
      'Content-Type': 'aplication/json',
      'Accept': 'application/json'
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

      return user;
    } else {
      throw Exception('Gagal Login !');
    }
  }
}
