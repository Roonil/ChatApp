import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../remote/register.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/register';
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void register() {
    TestRegistration.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        username: userNameController.text);
  }

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Register")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(height: 2),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: "Enter your name",
                label: Text("Name"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(height: 2),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter your username",
                  label: Text("Username")),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(height: 2),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter your email",
                  label: Text("Email")),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(height: 2),
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: "Enter your password",
                  label: Text("Password")),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: TextField(
              obscureText: true,
              controller: repeatPasswordController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(height: 2),
                contentPadding: EdgeInsets.zero,
                hintText: "Re-enter your password",
                border: InputBorder.none,
                label: Text("Re-enter Password"),
              ),
            ),
          ),
          ElevatedButton(onPressed: register, child: const Text("Register")),
          const TextButton(
              onPressed: null, child: Text("Already have an account?"))
        ],
      ),
    );
  }
}
