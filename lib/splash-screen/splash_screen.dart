import 'package:flutter/material.dart';
import 'package:funny_voice_changer/splash-screen/splash_services.dart';

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
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.music_off,
                size: 150,
                color: Colors.white,
              ),
            ),
            Align(
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
                    SplashServices(),
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
