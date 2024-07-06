import 'package:flutter/material.dart';
//import 'package:flutter_application_w8/screens/chat_screen.dart';
//import 'package:flutter_application_w8/screens/registry_screen.dart';

class MyButton extends StatelessWidget {
  final String label;

  final Function()? onPressed;
  const MyButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: onPressed,
          // onPressed: () => Navigator.pushNamed(context, routeName),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink)),
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
