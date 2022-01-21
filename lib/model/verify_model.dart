class VerifyModel {
  String? email;
  String? otp;
  String? token;

  VerifyModel({
    this.otp,
    this.email,
    this.token,
  });

  VerifyModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'email': email,
      'token': token,
    };
  }
}
