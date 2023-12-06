import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funny_voice_changer/screens/onboarding_screen.dart';

class SplashServices extends StatefulWidget {
  const SplashServices({super.key});

  @override
  State<SplashServices> createState() => _SplashServicesState();
}

class _SplashServicesState extends State<SplashServices> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.02;
        if (progress >= 1) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LanguagesPage()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      backgroundColor: Colors.white,
      valueColor: const AlwaysStoppedAnimation(Colors.blue),
    );
  }
}
