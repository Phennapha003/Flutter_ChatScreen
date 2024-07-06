// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/message/message_sender_name.dart';
import 'package:flutter_application_w8/components/chat/message/message_text.dart';
import 'package:flutter_application_w8/components/chat/message/message_timestamp.dart';

class ChatMessage extends StatelessWidget {
  ChatMessage({super.key, required this.isMe, required this.data});
  Map<String, dynamic> data;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        MessageSenderName(data: data),
        MessageText(data: data, isMe: isMe),
        MessageTimestamp(data: data),
      ],
    );
  }
}
