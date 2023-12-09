import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  Duration duration = const Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${duration.inSeconds}',
          style: const  TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
