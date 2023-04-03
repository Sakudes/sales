import 'package:flutter/material.dart';

import 'views/CompanyCreateStep.dart';
import 'views/Register.dart';
import 'views/SingIn.dart';
import 'views/Test.dart';
import 'views/СhoicePage.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: '',
      routes: {
        '/': (context) => const SingIn(),
        '/choise': (context) => const ChoicePage(),
        '/com': (context) => const CompanyCreateStep(),
        '/reg': (context) => const Register(),
        '/test': (context) => const Test()
      },
    );

  }
}
