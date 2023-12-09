import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final audioPlayer =  AudioPlayer();
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Audio Player',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              Slider(
                min: 0,
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
              ),
              Text(formatTime(position)),
              Text(formatTime(duration - position)),
              CircleAvatar(
                radius: 20,
                child: IconButton(
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      }else {
                        String url = 'https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbHMwYjZ0SHAzd0t4VXd3MS1ONlNrMHNnRGZWUXxBQ3Jtc0tsVUZUSzljTXByVHJfQlVkd2NCbzNfbkNad1VrMW8tNDRUbF9kNmp6QmZwV2pvZlI3Q3RlSFVZb0N1Y1YtSUhySVEyRm56VlBGV0lmNTdRZUowWV9acWt5aEN0Qlp0djBkRk5uQlgxMEN6dWxNcDY4bw&q=https%3A%2F%2Ffilesamples.com%2Fsamples%2Faudio%2Fmp3%2FSymphony%2520No.6%2520%281st%2520movement%29.mp3%27%29%3B&v=i9a-o3zhQ_Q';
                        await audioPlayer.play(url as Source);
                      }
                    },
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow)),
              )
            ],
          ),
        ],
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
