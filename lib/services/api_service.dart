import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  // static Future<Map<String, dynamic>> login(String username, String password) async {
  //   final response = await http.post(
  //     Uri.parse('$baseUrl/auth/login'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'username': username, 'password': password}),
  //   );
  //   if (response.statusCode == 201) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception("Login failed");
  //   }
  // }
  static Future<Map<String, dynamic>> login(String username, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  if (response.statusCode == 201 ) {
    final data = jsonDecode(response.body);
    // ✅ Show success message
    Get.snackbar(
      "Success",
      "Login successful!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    return data;
  } else {
     Get.snackbar(
      "Login Failed",
      "Error: ${response.body}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    throw Exception("Login failed: ${response.body}");
  }
}

  
//   static Future<Map<String, dynamic>> login(String username, String password) async {
//   final response = await http.post(
//     Uri.parse('$baseUrl/auth/login'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({'username': username, 'password': password}),
//   );

//   if (response.statusCode == 201) {
//     return jsonDecode(response.body);
//   } else {
//     // Print server response for debugging
//     print("Status code: ${response.statusCode}");
//     print("Response body: ${response.body}");
//     throw Exception("Login failed: ${response.body}");
//   }
// }


  static Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }

  static Future<Map<String, dynamic>> getProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load product");
    }
  }
}
