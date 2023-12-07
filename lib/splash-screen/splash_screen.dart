import 'package:flutter/material.dart';
import 'package:funny_voice_changer/utils/linear_progress_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //... Main container of the Splash Screen
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.blue,
            ],
          ),
        ),
        child: const Stack(
          //... Stack used for Positioning of the Widgets on the Screen
          children: [
            Align(
              //... First child of Stack (ICON)
              alignment: Alignment.center,
              child: Icon(
                Icons.music_off,
                size: 150,
                color: Colors.white,
              ),
            ),
            Align(
              //... Second child of Stack (COLUMN)
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Voice Changer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LinearProgressWidget(), //... LinearProgressWidget called here
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'This action may contain ad',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
