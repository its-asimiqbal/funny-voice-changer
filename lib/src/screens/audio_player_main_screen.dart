import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioPlayerMainScreen extends StatefulWidget {
  AudioPlayerMainScreen({
    super.key,
    this.textToSpeech,
    this.recordedPathNew,
    this.audioModel,
    this.audioPlayerNew,
    this.text,
  });

  dynamic textToSpeech;
  dynamic recordedPathNew;
  dynamic audioModel;
  dynamic audioPlayerNew;
  dynamic text;

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
  }

  void playAudio() async {
    String textController;

    if (widget.recordedPathNew != null) {
      print('Errorororrorororo ${widget.recordedPathNew['Path']}');
      // Play recorded audio
      try {
        await audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(widget.recordedPathNew['audioPath']),
          ),
        );
        await audioPlayer.play();
        setState(() => isPlaying = true);
      } on Exception {
        log('Cannot access recorded audio');
      }
    }

    if (widget.audioPlayerNew['audioPlayer'] != null) {
      if (widget.audioModel['audioModel'] is AudioPlayer) {
        await widget.audioPlayerNew.play();
      }
      widget.audioPlayerNew['audioPlayer'].setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.audioModel['audioModel'].toString()),
        ),
        AudioSource.uri(
          widget.audioModel['audioModel'],
        ),
      );
      widget.audioPlayerNew['audioPlayer'].play();
      isPlaying = true;
    } else if (widget.textToSpeech != null) {
      // Play text-to-speech
      try {
        textController = widget.textToSpeech['textController'];
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
          ],
        ),
      ),
    );
  }
}
