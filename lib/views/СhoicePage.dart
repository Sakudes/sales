import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales/widgets/Button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
            child: Column(
              children: [
                SvgPicture.asset(
                  'images/men_on_oclok.svg',
                ),
                Button(
                  buttonName: 'Продолжить',
                  fullWidht: true,
                ),
              ],
            )));
  }
}
