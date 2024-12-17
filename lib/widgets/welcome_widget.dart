import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vmart/screens/home_screen.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Lottie.asset(
            "lib/assets/jsons/welcome.json",
            repeat: true,
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
