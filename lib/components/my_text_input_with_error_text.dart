// ignore_for_file: unnecessary_import, camel_case_types, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/input_with_error_text.dart';

class MyTextInputWithErrorText extends StatelessWidget {
  InputWithErrorText input;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;

  MyTextInputWithErrorText({
    super.key,
    required this.input,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        onChanged: (value) {
          input.valueText = value;
        },
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: input.errorText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.blueGrey,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
