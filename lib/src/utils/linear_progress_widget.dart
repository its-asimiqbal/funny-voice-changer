import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';

class LinearProgressWidget extends StatefulWidget {
  const LinearProgressWidget({super.key});

  @override
  State<LinearProgressWidget> createState() => _LinearProgressWidgetState();
}

class _LinearProgressWidgetState extends State<LinearProgressWidget> {
  double _initialValue = 0.0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startNavigation();
  }

  void _startNavigation() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _initialValue +=
            0.02; // Adjust this increment based on your requirements
      });

      if (_initialValue >= 1) {
        timer.cancel();
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Future.delayed(Duration.zero, () {
      Navigator.pushNamed(context, RoutesName.languagesScreen1);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: _initialValue,
      backgroundColor: Colors.white,
      valueColor: const AlwaysStoppedAnimation(
        Colors.blue,
      ),
    );
  }
}
