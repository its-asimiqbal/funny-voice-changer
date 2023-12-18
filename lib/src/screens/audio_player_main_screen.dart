// // import 'package:audioplayers/audioplayers.dart';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class AudioPlayerMainScreen extends StatefulWidget {
//   AudioPlayerMainScreen(
//       {super.key, this.text, this.recordedPath, this.audioModel, this.audioPlayerNew});

//   dynamic text;
//   dynamic recordedPath;
//   dynamic audioModel;
//   dynamic audioPlayerNew;

//   @override
//   State<AudioPlayerMainScreen> createState() => _AudioPlayerMainScreenState();
// }

// class _AudioPlayerMainScreenState extends State<AudioPlayerMainScreen> {
//   final audioPlayer = AudioPlayer();

//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;

//   bool isPlaying = false;
// // late Duration duration;
// // late Duration position;

//   @override
//   void initState() {
//     super.initState();

//     // Listen to player state
//     audioPlayer.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });

//     // Listen to audio duration
//     audioPlayer.durationStream.listen((newDuration) {
//       setState(() {
//         duration = newDuration!;
//       });
//     });

//     // Listen to audio position
//     audioPlayer.positionStream.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });

//     // playAudio();
//   }

//    void playAudio() {
//     try {
//       widget.audioPlayerNew.setAudioSource(
//         AudioSource.uri(
//           Uri.parse(widget.audioModel.uri),
//         ),
//       );
//       widget.audioPlayerNew.play();
//       isPlaying = true;
//     } on Exception {
//       log('Cannot parse audio');
//     }

//     // widget.audioPlayerNew.durationStream.listen((newDuration) {
//     //   setState(() {
//     //     duration = newDuration!;
//     //   });
//     // });
//     // widget.audioPlayerNew.positionStream.listen((newPosition) {
//     //   setState(() {
//     //     position = newPosition;
//     //   });
//     // });
//   }

//   // bool isPlaying = false;
//   // @override
//   // void initState() {
//   //   super.initState();

//   //   // Listen to states: playing, paused, stopped
//   //   audioPlayer.onPlayerStateChanged.listen((state) {
//   //     setState(() {
//   //       isPlaying = state == PlayerState.playing;
//   //     });
//   //   });

//   //   // Listen to audio duration
//   //   audioPlayer.onDurationChanged.listen((newDuration) {
//   //     setState(() {
//   //       duration = newDuration;
//   //     });
//   //   });

//   //   // Listen to audio postion
//   //   audioPlayer.onPositionChanged.listen((newPosition) {
//   //     setState(() {
//   //       position = newPosition;
//   //     });
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // final path = ModalRoute.of(context)!.settings.arguments as Map;
//     // print('Path Received - ${path.toString()}');
//     // final path = ModalRoute.of(context)?.settings.arguments as Map?;

//     // if (path == null) {
//     //   return const Scaffold(
//     //     body: Center(
//     //       child: Text(
//     //         'Error: Arguments are null',
//     //         style: TextStyle(color: Colors.red),
//     //       ),
//     //     ),
//     //   );
//     // }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Audio Player',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Slider(
//               min: 0,
//               max: duration.inSeconds.toDouble(),
//               value: position.inSeconds.toDouble(),
//               activeColor: Colors.deepPurple,
//               onChanged: (value) async {
//                 final position = Duration(seconds: value.toInt());
//                 await audioPlayer.seek(position);

//                 // // optional
//                 await audioPlayer.pause();
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(position.toString().split('.')[0]),
//                   Text(duration.toString().split('.')[0]),
//                 ],
//               ),
//             ),
//             // CircleAvatar(
//             //   radius: 35,
//             //   backgroundColor: Colors.deepPurple,
//             //   child: IconButton(
//             //     onPressed: () {
//             //       if (isPlaying) {
//             //         audioPlayer.pause();
//             //       } else {
//             //         // print(widget.recordedPath.toString() + "hellloooo");
//             //         audioPlayer.play(
//             //             DeviceFileSource(widget.recordedPath['audioPath']));
//             //       }
//             //     },
//             //     icon: Icon(
//             //       isPlaying ? Icons.pause : Icons.play_arrow,
//             //       color: Colors.white,
//             //     ),
//             //     iconSize: 50,
//             //   ),
//             // ),
//             CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.deepPurple,
//               child: IconButton(
//                 onPressed: () async {
//                   if (isPlaying) {
//                     await audioPlayer.pause();
//                   } else if (widget.recordedPath != null){
//                     // Load the audio file using a ConcatenatingAudioSource
//                     final audioSource = ConcatenatingAudioSource(
//                       children: [
//                         AudioSource.uri(
//                           Uri.parse(widget.recordedPath['audioPath']),
//                         ),
//                       ],
//                     );

//                     // Set the player's source and play
//                     await audioPlayer.setAudioSource(audioSource);
//                     await audioPlayer.play();
//                   }
//                   else if (widget.audioPlayerNew != null){
//                     widget.audioPlayerNew.play(['audioPlayer']);
//                   }

//                   setState(() => isPlaying = audioPlayer.playing);
//                 },
//                 icon: Icon(
//                   isPlaying ? Icons.pause : Icons.play_arrow,
//                   color: Colors.white,
//                 ),
//                 iconSize: 50,
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             const Center(
//               child: Text('Path'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TestScreen extends StatelessWidget {
//   // static const String routeName = '/testScreen';
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final data = ModalRoute.of(context)!.settings.arguments;
//     print(data.toString() + 'aaaaaaaaaaa');
//     return const Placeholder();
//   }
// }

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class AudioPlayerMainScreen extends StatefulWidget {
//   AudioPlayerMainScreen({
//     super.key,
//     this.textToSpeech,
//     this.recordedPath,
//     this.audioModel,
//     this.audioPlayerNew,
//   });

//   dynamic textToSpeech;
//   dynamic recordedPath;
//   dynamic audioModel;
//   dynamic audioPlayerNew; // Update type to AudioPlayer or clarify its purpose

//   @override
//   State<AudioPlayerMainScreen> createState() => _AudioPlayerMainScreenState();
// }

// class _AudioPlayerMainScreenState extends State<AudioPlayerMainScreen> {
//   final audioPlayer = AudioPlayer();

//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   final FlutterTts flutterTts = FlutterTts();
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();

//     // Listen to player state
//     audioPlayer.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });

//     // Listen to audio duration
//     audioPlayer.durationStream.listen((newDuration) {
//       setState(() {
//         duration = newDuration!;
//       });
//     });

//     // Listen to audio position
//     audioPlayer.positionStream.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }

//   void textToSpeech(String text) async {
//     await flutterTts.setLanguage("en-US");
//     // You can uncomment these lines if you want to adjust volume and speech rate
//     // await flutterTts.setVolume(0.5);
//     // await flutterTts.setSpeechRate(0.5);

//     await flutterTts.setPitch(1.5);
//     await flutterTts.speak(text);
//   }

//   void playAudio() async {
//     if (widget.audioPlayerNew != null) {
//       print('File Get');
//       // Play audio from the received audio model
//       try {
//         await audioPlayer.setAudioSource(
//           AudioSource.uri(
//             Uri.parse(widget.audioModel.uri),
//           ),
//         );
//         await audioPlayer.play();
//         isPlaying = true;
//       } on Exception {
//         log('Cannot parse audio');
//       }
//     } else if (widget.recordedPath != null) {
//       print('Record Get');
//       // Play the recorded audio
//       try {
//         await audioPlayer.setAudioSource(
//           AudioSource.uri(
//             Uri.parse(widget.recordedPath['audioPath']),
//           ),
//         );
//         await audioPlayer.play();
//         isPlaying = true;
//       } on Exception {
//         log('Cannot access recorded audio');
//       }
//     } else if (widget.textToSpeech != null) {
//       widget.textToSpeech(['textController']);
//     }
//     // else if (widget.audioPlayerNew != null) {
//     //   // Use the provided audio player (clarify its usage)
//     //   if (widget.audioPlayerNew is AudioPlayer) {
//     //     // If it's an AudioPlayer, directly control it
//     //     await widget.audioPlayerNew.play();
//     //   } else {
//     //     // Handle other types of audio players based on their functionality
//     //     log('Unrecognized audio player type');
//     //   }
//     // } else {
//     //   // No audio source available
//     //   log('No audio source provided');
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //  final path = ModalRoute.of(context)!.settings.arguments as Map;
//     // print('Path Received - ${path.toString()}');
//     // final path = ModalRoute.of(context)?.settings.arguments as Map?;

//     // if (path == null) {
//     //   return const Scaffold(
//     //     body: Center(
//     //       child: Text(
//     //         'Error: Arguments are null',
//     //         style: TextStyle(color: Colors.red),
//     //       ),
//     //     ),
//     //   );
//     // }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Audio Player',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Slider(
//               min: 0,
//               max: duration.inSeconds.toDouble(),
//               value: position.inSeconds.toDouble(),
//               activeColor: Colors.deepPurple,
//               onChanged: (value) async {
//                 final position = Duration(seconds: value.toInt());
//                 await audioPlayer.seek(position);

//                 // // optional
//                 await audioPlayer.pause();
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(position.toString().split('.')[0]),
//                   Text(duration.toString().split('.')[0]),
//                 ],
//               ),
//             ),
//             CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.deepPurple,
//               child: IconButton(
//                 onPressed: () async {
//                   if (isPlaying) {
//                     await audioPlayer.pause();
//                   } else {
//                     playAudio();
//                   }

//                   setState(() => isPlaying = audioPlayer.playing);
//                 },
//                 icon: Icon(
//                   isPlaying ? Icons.pause : Icons.play_arrow,
//                   color: Colors.white,
//                 ),
//                 iconSize: 50,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// String formatTime(Duration duration) {
//   String twoDigits(int n) => n.toString().padLeft(2, '0');
//   final hours = twoDigits(duration.inHours);
//   final minutes = twoDigits(duration.inMinutes.remainder(60));
//   final seconds = twoDigits(duration.inSeconds.remainder(60));

//   return [
//     if (duration.inHours > 0) hours,
//     minutes,
//     seconds,
//   ].join(':');
// }

// import 'package:audioplayers/audioplayers.dart'; // Remove this import since you're using just_audio
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioPlayerMainScreen extends StatefulWidget {
  AudioPlayerMainScreen({
    super.key,
    this.textToSpeech,
    this.recordedPath,
    this.audioModel,
    this.audioPlayerNew,
    this.text,
  });

  dynamic textToSpeech;
  dynamic recordedPath;
  dynamic audioModel;
  dynamic audioPlayerNew;
  dynamic text;
  // Update type to AudioPlayer or clarify its purpose

  @override
  State<AudioPlayerMainScreen> createState() => _AudioPlayerMainScreenState();
}

class _AudioPlayerMainScreenState extends State<AudioPlayerMainScreen> {
  final audioPlayer = AudioPlayer();
  final FlutterTts flutterTts = FlutterTts();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen to player state
    audioPlayer.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state.playing;
      });
    });

    // Listen to audio duration
    audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        duration = newDuration!;
      });
    });

    // Listen to audio position
    audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Initialize FlutterTts
    // flutterTts.setLanguage("en-US"); // Change language according to your needs
   
  }

  

  void playAudio() async {
    String textController;
    if (widget.audioPlayerNew != null) {
      // Play audio from provided `audioPlayerNew` (clarify its usage)
      if (widget.audioPlayerNew is AudioPlayer) {
        await widget.audioPlayerNew.play();
      } else {
        log('Unrecognized audio player type');
      }
    } else if (widget.recordedPath != null) {
      // Play recorded audio
      try {
        await audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(widget.recordedPath['audioPath']),
          ),
        );
        await audioPlayer.play();
        setState(() => isPlaying = true);
      } on Exception {
        log('Cannot access recorded audio');
      }
    } 
    else if (widget.textToSpeech != null) {
      // Play text-to-speech
      try {
       textController =
            widget.textToSpeech['textController'];
        if (textController != null) {
          String text = textController;
          await flutterTts.speak(text);
           setState(() => isPlaying = true);
        } else {
          log('Text controller is null');
        }
      } on Exception {
        log('Error playing text-to-speech');
      }
    } else {
      log('No audio source provided');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Audio Player',
          // widget.text['path'],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              activeColor: Colors.deepPurple,
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);

                // // optional
                await audioPlayer.pause();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(position.toString().split('.')[0]),
                  Text(duration.toString().split('.')[0]),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.deepPurple,
              child: IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    playAudio();
                  }

                  setState(() => isPlaying = audioPlayer.playing);
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 50,
              ),
            ),

            SizedBox(height: 100,),
            Text(widget.textToSpeech['textController']),
             Text(widget.text['path']),
          ],
        ),
      ),
    );
  }
}
