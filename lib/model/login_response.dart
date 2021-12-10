import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.token,
  });

  String? token;

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
