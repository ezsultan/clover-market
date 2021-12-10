import 'package:http/http.dart';

import '../model/login_request.dart';
import '../model/login_response.dart';

class ApiClient {
  static Future<LoginResponse> login(LoginRequest user) async {
    Uri uri = Uri.https('api-clover.herokuapp.com', '/api/login');
    Response response = await post(uri, body: user.toMap());
    return LoginResponse.fromJson(response.body);
  }
}
