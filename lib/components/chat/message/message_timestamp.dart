// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTimestamp extends StatelessWidget {
  MessageTimestamp({super.key, required this.data});
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String text = '';
    if (data['timestamp'] != null) {
      DateTime timestamp = data['timestamp'].toDate();
      DateTime today = DateTime.now();
      Duration timeago = today.difference(timestamp);
      text = DateFormat.yMMMMd().format(timestamp);
      if (timeago.inDays < 1) {
        text = 'today ${DateFormat.Hm().format(timestamp)}';
      }
    }
    return Text(text);
  }
}
