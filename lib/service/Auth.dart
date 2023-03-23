import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<void> auth(String phone, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.56.1:45432/api/v1/auth/authenticate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"phone": phone, "password": password}),
    );
    if (response.statusCode == 200) {
      // обработка успешного ответа
      print(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = jsonDecode(response.body)['token'];
      await prefs.setString('token', token);

      Navigator.pushNamed(context, '/reg');
    } else {
      // обработка ошибки
      print('Ошибка запроса: ${response.statusCode}');
    }
  }

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return false;
    }
    bool isTokenExpired = JwtDecoder.isExpired(token);
    return !isTokenExpired;
  }

  Future<bool> checkRole(String expectedRole) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) {
      return false;
    }
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    String userRole = decodedToken['role'];
    return userRole == expectedRole;
  }
}
