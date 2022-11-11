import 'dart:convert';
import 'package:http/http.dart' as http;

import '../strings/server_host.dart';

class TestRegistration {
  static Uri url = Uri.parse("${serverHost}user/signup");
  static void register(
      {required String email,
      required String name,
      required String password,
      required String username}) async {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": email,
          "name": name,
          "userName": username,
          "password": password,
        }));

    print(response.body);
  }
}
