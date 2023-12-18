import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image2.png',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Troll your friends',
              style: TextStyle(
               fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Unleash your creativity with voices',
            
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
