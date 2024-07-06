// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/chat_message.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key, required this.snapshot, this.user});
  AsyncSnapshot<QuerySnapshot> snapshot;
  User? user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        bool isMe = user!.email == data['sender'];
        return Padding(
          padding: const EdgeInsets.all(0.5),
          child: ChatMessage(isMe: isMe, data: data),
        );
      }).toList(),
    );
  }
}
