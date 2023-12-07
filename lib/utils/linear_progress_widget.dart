import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funny_voice_changer/screens/languages_screen.dart';

class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({super.key});

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget> {

  //... Here is the logic for the Determinate Linear Progress Indicator

  double _initialValue = 0.0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _initialValue += 0.03;
        if (_initialValue >= 1) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LanguagesScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _initialValue,
      backgroundColor: Colors.white,
      valueColor: const AlwaysStoppedAnimation(Colors.blue),
    );
  }
}
