import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../service/Auth.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isAdmin = false;

  @override
  void initState() {
    super.initState();
    final auth = Auth();
    auth.isLoggedIn().then((isLoggedIn) {
      if (!isLoggedIn) {
        Navigator.of(context).pushReplacementNamed('/com');
      } else {
        auth.checkRole('OWNER').then((isAdmin) {
          setState(() {
            _isAdmin = isAdmin;
          });
          if (!isAdmin) {
            Navigator.of(context).pushReplacementNamed('/choise');
          }
        });
      }
    });
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
              Text('data'),
              if (_isAdmin) Text('Добавить новый элемент'),
            ],
          )),
    );
  }
}
