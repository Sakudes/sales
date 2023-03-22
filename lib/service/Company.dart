import 'dart:convert';

import 'package:http/http.dart' as http;

class Company {
  void createCompany(text) async {
    final response = await http.post(
      Uri.parse('http://192.168.56.1:45432/api/v1/companies'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': text}),
    );

    if (response.statusCode == 200) {
      // обработка успешного ответа
      print(response.body);
    } else {
      // обработка ошибки
      print('Ошибка запроса: ${response.statusCode}');
    }
  }
}
