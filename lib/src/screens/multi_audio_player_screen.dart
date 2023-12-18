// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MultiAudioPlayerScreen extends StatefulWidget {
//   @override
//   _MultiAudioPlayerScreenState createState() =>
//       _MultiAudioPlayerScreenState();
// }

// class _MultiAudioPlayerScreenState extends State<MultiAudioPlayerScreen> {
//   OnAudioQuery? audioQuery;
//   final audioPlayer = AudioPlayer();
//   final FlutterTts flutterTts = FlutterTts();
//   final TextEditingController textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     requestPermission().then((granted) {
//       if (granted) {
//         audioQuery = OnAudioQuery();
//       } else {
//         // Handle permission denied
//       }
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<bool> requestPermission() async {
//     final status = await Permission.audio.request();
//     return status.isGranted;
//   }

//   void playAudio(String uri) {
//     try {
//       audioPlayer.setAudioSource(
//         AudioSource.uri(
//           Uri.parse(uri),
//         ),
//       );
//       audioPlayer.play();
//     } on Exception {
//       // Handle audio playback error
//     }
//   }

//   void playTextToSpeech(String text) async {
//     await flutterTts.setLanguage("en-US");
//     await flutterTts.setPitch(1.5);
//     await flutterTts.speak(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Multi Audio Player'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               // Start recording audio and play it
//               // Implement your recording logic here
//             },
//             child: const Text('Record and Play'),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               // Choose audio file from local device and play it
//               await requestPermission();
//               List<SongModel> songs = await audioQuery!.querySongs(
//                 sortType: null,
//                 orderType: OrderType.ASC_OR_SMALLER,
//                 uriType: UriType.EXTERNAL,
//                 ignoreCase: true,
//               );
//               if (songs.isNotEmpty) {
//                 playAudio(songs.first.uri!);
//               }
//             },
//             child: const Text('Audio from Device'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Convert text to speech and play it
//               playTextToSpeech(textEditingController.text);
//             },
//             child: const Text('Text to Speech'),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class MultiAudioPlayerScreen extends StatefulWidget {
//   final String? recordedPath;
//   final String? audioFilePath;
//   final String? textToSpeech;

//   MultiAudioPlayerScreen({
//     Key? key,
//     this.recordedPath,
//     this.audioFilePath,
//     this.textToSpeech,
//   }) : super(key: key);

//   @override
//   _MultiAudioPlayerScreenState createState() =>
//       _MultiAudioPlayerScreenState();
// }

// class _MultiAudioPlayerScreenState extends State<MultiAudioPlayerScreen> {
//   final audioPlayer = AudioPlayer();
//   final FlutterTts flutterTts = FlutterTts();
//   double _sliderValue = 0.0;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _initAudioPlayer();
//   // }

//   //  void _initAudioPlayer() {
//   //   audioPlayer.playerStateStream.listen((PlayerState state) {
//   //     setState(() {
//   //       _sliderValue = state.position.inMilliseconds.toDouble();
//   //       _maxSliderValue = state.duration?.inMilliseconds.toDouble() ?? 1.0;
//   //     });
//   //   });
//   // }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<void> _playAudio(String? path) async {
//     try {
//       await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(path!)));
//       await audioPlayer.play();
//     } catch (e) {
//       // Handle audio playback error
//       print("Error playing audio: $e");
//     }
//   }

//   Future<void> _playTextToSpeech(String? text) async {
//     try {
//       await flutterTts.setLanguage("en-US");
//       await flutterTts.setPitch(1.5);
//       await flutterTts.speak(text!);
//     } catch (e) {
//       // Handle text-to-speech error
//       print("Error playing text-to-speech: $e");
//     }
//   }

//   Future<void> _pauseAudio() async {
//     await audioPlayer.pause();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Multi Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Slider(
//               value: _sliderValue,
//               max: audioPlayer.duration?.inMilliseconds.toDouble() ?? 1.0,
//               onChanged: (value) {
//                 setState(() {
//                   _sliderValue = value;
//                 });
//                 audioPlayer.seek(Duration(milliseconds: value.toInt()));
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (widget.recordedPath != null) {
//                   _playAudio(widget.recordedPath);
//                 } else if (widget.audioFilePath != null) {
//                   _playAudio(widget.audioFilePath);
//                 } else if (widget.textToSpeech != null) {
//                   _playTextToSpeech(widget.textToSpeech);
//                 }
//               },
//               child: const Text('Play'),
//             ),
//             ElevatedButton(
//               onPressed: _pauseAudio,
//               child: const Text('Pause'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//

// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class MultiAudioPlayerScreen extends StatefulWidget {
//   final String? recordedPath;
//   final String? audioFilePath;
//   final String? textToSpeech;

//   MultiAudioPlayerScreen({
//     Key? key,
//     this.recordedPath,
//     this.audioFilePath,
//     this.textToSpeech,
//   }) : super(key: key);

//   @override
//   _MultiAudioPlayerScreenState createState() =>
//       _MultiAudioPlayerScreenState();
// }

// class _MultiAudioPlayerScreenState extends State<MultiAudioPlayerScreen> {
//   final AudioPlayer audioPlayer = AudioPlayer();
//   final FlutterTts flutterTts = FlutterTts();
//   double _sliderValue = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _initAudioPlayer();
//   }

//   void _initAudioPlayer() {
//     audioPlayer.onPlayerStateChanged.listen(( duration) {
//       setState(() {
//         _sliderValue = duration.inMilliseconds.toDouble();
//       });
//     });

//     audioPlayer.onDurationChanged.listen((Duration duration) {
//       setState(() {
//         _sliderValue = 0.0;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<void> _playAudio(String? path) async {
//     try {
//       await audioPlayer.play(path!, isLocal: true);
//     } catch (e) {
//       // Handle audio playback error
//       print("Error playing audio: $e");
//     }
//   }

//   Future<void> _playTextToSpeech(String? text) async {
//     try {
//       await flutterTts.setLanguage("en-US");
//       await flutterTts.setPitch(1.5);
//       await flutterTts.speak(text!);
//     } catch (e) {
//       // Handle text-to-speech error
//       print("Error playing text-to-speech: $e");
//     }
//   }

//   Future<void> _pauseAudio() async {
//     await audioPlayer.pause();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Multi Audio Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Slider(
//               value: _sliderValue,
//               max: audioPlayer.duration.inMilliseconds.toDouble() ?? 1.0,
//               onChanged: (value) {
//                 setState(() {
//                   _sliderValue = value;
//                 });
//                 audioPlayer.seek(Duration(milliseconds: value.toInt()));
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (widget.recordedPath != null) {
//                   _playAudio(widget.recordedPath);
//                 } else if (widget.audioFilePath != null) {
//                   _playAudio(widget.audioFilePath);
//                 } else if (widget.textToSpeech != null) {
//                   _playTextToSpeech(widget.textToSpeech);
//                 }
//               },
//               child: const Text('Play'),
//             ),
//             ElevatedButton(
//               onPressed: _pauseAudio,
//               child: const Text('Pause'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
