// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class SenderAvatar extends StatelessWidget {
  SenderAvatar({super.key, required this.data});
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String email = data['sender'];
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('users').doc(email).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/message.png'),
            );
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('images/message.png'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            ImageProvider img = const AssetImage('images/message.png');

            if (data['avatar_url'] != null) {
              try {
                img = NetworkImage(data['avatar_url']);
              } catch (e) {
                dev.log('Error loading image: $e');
              }
            }
            return CircleAvatar(
              radius: 15,
              backgroundImage: img,
            );
            // return const CircleAvatar(
            //   radius: 15,
            //   backgroundImage: AssetImage('images/message.png'),
            // );
          }
          return const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(),
          );
        });
  }
}
