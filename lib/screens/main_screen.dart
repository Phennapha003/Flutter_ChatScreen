// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_w8/screens/registry_screen.dart';
import 'package:flutter_application_w8/screens/sign_in_screen.dart';

import '../components/navigation_button.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animationColor = ColorTween(begin: Colors.white, end: Colors.pink)
        .animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse(from: 2);
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainScreen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: animationController.value * 60,
              child:
                  Hero(tag: 'Logo', child: Image.asset('images/message.png')),
            ),
          ),
          Center(
            child: Text(
              ' Rocket Chat',
              style: TextStyle(
                fontSize: 20,
                color: animationColor.value,
              ),
            ),
          ),
          const NavigationButton(
            label: 'Sign-in',
            routeName: SignInScreen.id,
          ),
          const NavigationButton(
            label: 'Create an account',
            routeName: RegistryScreen.id,
          ),
        ],
      ),
    );
  }
}
