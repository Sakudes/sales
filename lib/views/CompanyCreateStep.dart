import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales/service/Company.dart';
import 'package:http/http.dart' as http;

class CompanyCreateStep extends StatefulWidget {
  const CompanyCreateStep({Key? key}) : super(key: key);

  @override
  State<CompanyCreateStep> createState() => _CompanyCreateStepState();
}

class _CompanyCreateStepState extends State<CompanyCreateStep> {
  final _controller = TextEditingController();

  void _createCompany(String companyName) {
    final company = Company();
    company.createCompany(companyName);
    companyName = '';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose(); // освобождаем контроллер
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'company neme',
                ),
                onSubmitted: (text) {
                  _createCompany(text);
                  text = '';
                  print(text);
                },
                onChanged: (text) {
                  text = '';
                  print(text);
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var companyName = _controller.text;
                  _createCompany(companyName);
                  companyName = '';
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Register extends StatelessWidget {
//   const Register({Key? key}) : super(key: key);

  
  
  

//   void createCompany(String companyName) async {
//     final response = await http.post(
//       Uri.parse('http://localhost:8080/api/v1/companies'),
//       body: {'name': companyName},
//     );

//     if (response.statusCode == 200) {
//       // обработка успешного ответа
//       print(response.body);
//     } else {
//       // обработка ошибки
//       print('Ошибка запроса: ${response.statusCode}');
//     }
//   }
// }
