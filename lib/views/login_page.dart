

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController(text: "mor_2314");
  final TextEditingController passwordController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => authController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  TextField(controller: usernameController, decoration: InputDecoration(labelText: "Username")),
                  TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      authController.login(usernameController.text, passwordController.text);
                    },
                    child: Text("Login"),
                  ),
                ],
              )),
      ),
    );
  }
}
