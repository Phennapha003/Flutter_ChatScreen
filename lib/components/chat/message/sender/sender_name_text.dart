import 'package:flutter/material.dart';

class SenderNameText extends StatelessWidget {
  const SenderNameText({super.key, required this.senderName});
  final String senderName;

  @override
  Widget build(BuildContext context) {
    return Text(senderName);
  }
}
