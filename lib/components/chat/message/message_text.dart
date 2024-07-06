// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/message/sender/sender_avartar.dart';

class MessageText extends StatelessWidget {
  MessageText({super.key, required this.data, required this.isMe});
  Map<String, dynamic> data;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe ? Text(data['text']) : SenderAvatar(data: data),
        !isMe ? Text(data['text']) : SenderAvatar(data: data),
      ],
    );
  }
}
