import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Input extends StatelessWidget {
  final String plaseholder;
  final double padding;
  final TextEditingController controller;
  const Input(
      {Key? key,
      required this.plaseholder,
      required this.controller,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            hoverColor: Colors.amber,
            hintText: (plaseholder),
          ),
          onChanged: (text) {
            text = '';
            print(text);
          }),
    );
  }
}
