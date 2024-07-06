// ignore_for_file: equal_keys_in_map

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_w8/firebase_options.dart';
import 'package:flutter_application_w8/screens/chat_screen.dart';
import 'package:flutter_application_w8/screens/main_screen.dart';
import 'package:flutter_application_w8/screens/registry_screen.dart';
import 'package:flutter_application_w8/screens/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: MainScreen.id,
      routes: {
        ChatScreen.id: (context) => const ChatScreen(),
        MainScreen.id: (context) => const MainScreen(),
        RegistryScreen.id: (context) => const RegistryScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
      },
    );
  }
}
