// ignore_for_file: sort_child_properties_last, unused_field, unused_local_variable, use_build_context_synchronously, unused_element, non_constant_identifier_names

import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/components/my_button.dart';
import 'package:flutter_application_w8/components/user_image_picker.dart';
import 'package:flutter_application_w8/screens/chat_screen.dart';
import '../components/my_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'registry_screen';
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String username;

  late File _avatar;
  void _pickedImageFile({required File pickedImageFile}) {
    _avatar = pickedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registry Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  child: Hero(
                      tag: 'Logo', child: Image.asset('images/message.png')),
                ),
              ),
              const Text('Create a new account')
            ],
          ),
          UserImagePicker(
            callback: _pickedImageFile,
          ),
          MyTextInput(
            hintText: 'Enter your username',
            keyboardType: TextInputType.text,
            onChanged: (value) {
              username = value;
            },
          ),
          MyTextInput(
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
          ),
          MyTextInput(
            hintText: 'Enter your password',
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              password = value;
            },
          ),
          MyButton(
            label: 'Next',
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                if (userCredential.user != null) {
                  String? avatarUrl;
                  try {
                    String ext = p.extension(_avatar.path);
                    String fileName = '${userCredential.user!.uid}$ext';
                    final StorageRef = FirebaseStorage.instance.ref();
                    final avatarRef = StorageRef.child(fileName)
                        .child('user_avatar')
                        .child(fileName);
                    await avatarRef.putData(
                      _avatar.readAsBytesSync(),
                      SettableMetadata(contentType: 'image/$ext'),
                    );
                    avatarUrl = await avatarRef.getDownloadURL();
                  } on FirebaseException catch (e) {
                    log(e.toString());
                  }
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(email)
                      .set({
                    'username': username,
                    'uid': userCredential.user!.uid,
                    'avatar_url': avatarUrl,
                  });
                  if (!mounted) return;
                  Navigator.pushNamed(context, ChatScreen.id);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  log('The password provided is too weak.');
                } else if (e.code == 'email=already-in-use') {
                  log('The account already exists for that email.');
                } else {
                  log(e.toString());
                }
              } catch (e) {
                log(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
