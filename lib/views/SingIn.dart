import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales/service/Auth.dart';
import 'package:sales/widgets/Input.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _phone = TextEditingController();
  final _password = TextEditingController();

  void _auth(String phone, String password) {
    final auth = Auth();
    auth.auth(phone, password, context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          children: <Widget>[
            Input(plaseholder: 'Номер', controller: _phone, padding: 0),
            Input(plaseholder: 'Пароль', controller: _password, padding: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  var phone = _phone.text;
                  var password = _password.text;
                  _auth(phone, password);
                },
                child: const Text('Вход'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/choise');
                },
                child: const Text('Зарегистрироваться'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
