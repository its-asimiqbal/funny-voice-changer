import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerScreenMain extends StatefulWidget {
  const AudioPlayerScreenMain({super.key, required this.recordedAudioPath});

  final String? recordedAudioPath;

  @override
  State<AudioPlayerScreenMain> createState() => _AudioPlayerScreenMainState();
}

class _AudioPlayerScreenMainState extends State<AudioPlayerScreenMain> {
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
    final audioSource = widget.recordedAudioPath;
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
                  // Text(formatTime(position)),
                  Text(position.toString().split('.')[0]),
                  // Text(formatTime(duartion - position)),
                  Text(duration.toString().split('.')[0]),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                onPressed: () {
                  if (isPlaying) {
                    audioPlayer.pause();
                  } else {
                    // String url = 'https://www.chosic.com/download-audio/29064/';
                    // var url1= 'assets/song.mp3' as Source;
                    // var url = Uri.parse('https://www.chosic.com/download-audio/29064/');
                    //  audioPlayer.play(AssetSource('song.mp3'));
                    audioPlayer.play(DeviceFileSource(audioSource!));
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
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
