import 'dart:convert';
import 'package:http/http.dart' as http;

class TestLogin {
  static Uri url = Uri.parse("http://10.0.2.2:3306/api/user/login");
  static Future<String> login(
      {required String password, required String username}) async {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "userName": username,
          "password": password,
        }));

    return response.body;
    //print(response.body);
  }
}
