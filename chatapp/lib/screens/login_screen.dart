import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: 100.0,
              height: 25,
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Username", style: TextStyle(fontSize: 12)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //Text("Username"),
            SizedBox(
              width: 100.0,
              height: 25,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text(
                    "Password",
                    style: TextStyle(fontSize: 12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
