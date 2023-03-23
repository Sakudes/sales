import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final bool fullWidht;

  const Button({Key? key, required this.buttonName, required this.fullWidht})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: fullWidht ? Size(double.infinity, 50) : null,
              elevation: 0.0,
              shadowColor: Colors.transparent,
              primary: Color.fromRGBO(182, 239, 17, 1)),
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Text(
              buttonName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
