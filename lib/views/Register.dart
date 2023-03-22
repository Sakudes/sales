import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales/service/Company.dart';
import 'package:http/http.dart' as http;
import 'package:sales/service/Registratiom.dart';
import 'package:sales/widgets/Input.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  void _reg(String firstName, String lastName, String phone, String password) {
    final reg = Registration();
    reg.reg(firstName, lastName, phone, password);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose(); // освобождаем контроллер
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
        child: Column(
          children: [
            Input(
              controller: _firstName,
              plaseholder: 'first neme',
              padding: 0,
            ),
            Input(
              controller: _lastName,
              plaseholder: 'last neme',
              padding: 20,
            ),
            Input(
              controller: _phone,
              plaseholder: 'phone',
              padding: 0,
            ),
            Input(
              controller: _password,
              plaseholder: 'password',
              padding: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var firstName = _firstName.text;
                  var lastName = _lastName.text;
                  var phone = _phone.text;
                  var password = _password.text;
                  _reg(firstName, lastName, phone, password);
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
