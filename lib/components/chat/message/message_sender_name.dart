// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/message/sender/sender_name_text.dart';

class MessageSenderName extends StatelessWidget {
  MessageSenderName({super.key, required this.data});
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String email = data['sender'];
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SenderNameText(senderName: 'unnamed');
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const SenderNameText(senderName: 'unnamed');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SenderNameText(senderName: data['username']);
          }
          return const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(),
          );
        });
  }
}
