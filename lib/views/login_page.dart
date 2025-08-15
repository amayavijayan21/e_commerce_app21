

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController =
      TextEditingController(text: "mor_2314");
  final TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  final RxBool isPasswordVisible = false.obs;    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => authController.isLoading.value
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // App Logo
                        const Icon(Icons.shopping_bag_outlined,
                            size: 80, color: Colors.deepOrange),
                        const SizedBox(height: 10),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Login to continue shopping",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30),
                        // Username
                        Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 2),
      )
    ],
  ),
  child: TextField(
    controller: usernameController,
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: "Username",
      prefixIcon: Padding(
        padding: EdgeInsets.only(top: 4), // adjust vertical alignment
        child: Icon(Icons.person_outline, color: Colors.grey, size: 25),
      ),
    ),
  ),
),

                        const SizedBox(height: 15),



Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6,
        offset: Offset(0, 2),
      )
    ],
  ),
  child: Obx(() => TextField(
        controller: passwordController,
        obscureText: !isPasswordVisible.value, // toggle visibility
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Password",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16), // keeps text centered
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.lock_outline, color: Colors.grey, size: 22),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              isPasswordVisible.value = !isPasswordVisible.value;
            },
          ),
        ),
      )),
),


                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.deepOrange,
                            ),
                            onPressed: () {
                              authController.login(usernameController.text,
                                  passwordController.text);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Forgot Password
                        TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?",
                              style: TextStyle(color: Colors.deepOrange)),
                        ),

                        const SizedBox(height: 20),

                        // Signup link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.deepOrange),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}



