// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/chat_listview.dart';

class ChatStreamBuilder extends StatelessWidget {
  ChatStreamBuilder({super.key, required this.messageStream, this.user});
  Stream<QuerySnapshot<Object?>> messageStream;
  User? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        }
        return Expanded(
          child: ChatListView(
            snapshot: snapshot,
            user: user,
          ),
        );
      },
      stream: messageStream,
    );
  }
}
