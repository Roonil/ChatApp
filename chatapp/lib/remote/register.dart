import 'dart:convert';

import 'package:http/http.dart' as http;

class TestRegistration {
  static Uri url = Uri.parse("http://localhost:3306/api/user/signup");
  static void register(
      {required String email,
      required String password,
      required String username}) async {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "userName": username,
          "password": password,
        }));

    print(response.body);
  }
}
