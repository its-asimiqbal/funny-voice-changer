import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/utils/recorder_button.dart';

class RecordAudioScreen extends StatefulWidget {
  const RecordAudioScreen({super.key});

  @override
  State<RecordAudioScreen> createState() => _RecordAudioScreenState();
}

class _RecordAudioScreenState extends State<RecordAudioScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Recording'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 198, 40, 230),
              Colors.blue,
            ],
          ),
        ),
        child: const Stack(
          children: [
             Align(
              // First
              alignment: Alignment.center,
              child: Icon(
                Icons.mic,
                size: 70,
                color: Colors.white,
              ),
            ),
          
            RecorderButton(),
          ],
        ),
      ),
    );
  }
}


  // GestureDetector(
            //   onTap: () async{
            //   },
            //   child: Align(
            //     // Second
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //       padding: const EdgeInsets.only(bottom: 40),
            //       child: Stack(
            //         alignment: Alignment.center,
            //         children: [
            //           Container(
            //             height: 50,
            //             width: 50,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(50),
            //               color: Colors.red,
            //             ),
            //           ),
            //           Container(
            //             height: 30,
            //             width: 30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(50),
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),