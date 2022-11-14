import 'dart:convert';
import 'package:http/http.dart' as http;

import '../strings/server_host.dart';

class TestLogin {
  static Uri url = Uri.parse("${serverHost}user/login");
  static Future<String> login(
      {required String password, required String username}) async {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "userName": username,
          "password": password,
        }));
    print(response.body);

    return response.body;
    //print(response.body);
  }
}
