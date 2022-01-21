class UserModel {
  int? id;
  String? username;
  String? email;
  String? token;
  String? otp;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.token,
    this.otp,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    token = json['token'];
    otp = json['email_otp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'email_otp': otp,
    };
  }
}
