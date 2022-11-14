import 'package:auto_route/auto_route.dart';
import 'package:chatapp/router/router.gr.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import '../remote/register.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = 'register';
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
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.purple),
                  color: Colors.black),
              child: TextFormField(
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'Please enter a name';
                  }
                  if (name.length < 4) {
                    return 'Name is too short';
                  }
                  return null;
                },
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
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.purple),
                  color: Colors.black),
              child: TextFormField(
                validator: (username) {
                  if (username == null || username.isEmpty) {
                    return 'Please enter a name';
                  }
                  if (username.length < 4) {
                    return 'Name is too short';
                  }
                  return null;
                },
                controller: userNameController,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(height: 2),
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Enter your username",
                    label: Text("Username")),
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
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                validator: (email) {
                  if (EmailValidator.validate(email!)) {
                    return null;
                  }
                  return 'email is not valid';
                },
                controller: emailController,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(height: 2),
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "Enter your email",
                    label: Text("Email")),
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
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'please enter a password';
                  }
                  return null;
                },
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
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.purple),
                color: Colors.black),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                validator: (pass) {
                  if (pass!.isEmpty) {
                    return 'please confirm your password';
                  }
                  if (pass != passwordController.text) {
                    return 'Password do not match please check again';
                  }
                  return null;
                },
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
          ),
          ElevatedButton(onPressed: register, child: const Text("Register")),
          TextButton(
              onPressed: () => context.router.pop().then((value) =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()))),
              child: const Text("Already have an account?"))
        ],
      ),
    );
  }
}
