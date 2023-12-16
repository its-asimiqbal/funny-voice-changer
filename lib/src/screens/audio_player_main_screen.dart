import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerMainScreen extends StatefulWidget {
  AudioPlayerMainScreen({super.key});

 

  @override
  State<AudioPlayerMainScreen> createState() => _AudioPlayerMainScreenState();
}

class _AudioPlayerMainScreenState extends State<AudioPlayerMainScreen> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen to states: playing, paused, stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // Listen to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to audio postion
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
// final String? audioPath = ModalRoute.of(context)!.settings.arguments as String?;
// final recordedAudioPath = ModalRoute.of(context)!.settings.arguments['recordedAudioPath'] as String;
    // final Map<String, String>? arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
    // if (arguments != null) {
    //   final recordedAudioPath = arguments['recordedAudioPath'] as String;
    //   // ... Use recordedAudioPath ...
    // }
    final  path = ModalRoute.of(context)?.settings.arguments;
    print('PATHHHHHHHHHH - $path');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Audio Player',
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
                await audioPlayer.resume();
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
                onPressed: () {
                  if (isPlaying) {
                    audioPlayer.pause();
                  } else {
                    // print(path);
                    audioPlayer.play(DeviceFileSource(path.toString()));
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}


class TestScreen extends StatelessWidget {
  static const String routeName = '/testScreen';
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    print(data.toString()+'asdasdasdasdasd');
    return const Placeholder();
  }
}