import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Registration {
  void reg(firstname, lastName, phone, password) async {
    final response = await http.post(
        Uri.parse('http://192.168.56.1:45432/api/v1/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "firstname": firstname,
          "lastname": lastName,
          "phone": phone,
          "role": 1,
          "company": {"id": 1},
          "password": password
        }));

    var authToken = await response.body;
    if (authToken != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('authToken', authToken);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('authToken');
    print('Saved token: $savedToken');
    if (response.statusCode == 200) {
      // обработка успешного ответа
      print(response.body);
    } else {
      // обработка ошибки
      print('Ошибка запроса: ${response.statusCode}');
    }
  }
}
