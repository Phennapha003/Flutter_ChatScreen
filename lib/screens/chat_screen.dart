// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/chat/chat_stream_builder.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
  String messageText = '';
  final Stream<QuerySnapshot> messageStream = FirebaseFirestore.instance
      .collection('messages')
      .orderBy('timestamp', descending: true)
      .snapshots();
  User? user;

  void getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
    } else {
      log(user!.email.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatScreen'),
        leading: null,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: Column(
        children: [
          ChatStreamBuilder(
            messageStream: messageStream,
            user: user,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: null,
                    controller: textController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      hintText: 'Type your message here....',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      textController.clear();
                      CollectionReference messages =
                          FirebaseFirestore.instance.collection('messages');
                      messages.add({
                        'sender': user!.email,
                        'text': messageText,
                        'timestamp':
                            Timestamp.now() //FieldValue.serverTimestamp(),
                      });
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
