import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AudioPlayerMainScreen extends StatefulWidget {
  AudioPlayerMainScreen({
    super.key,
    this.textToSpeech,
    this.recordedPathNew,
    // required this.audioModel,
    // this.audioPlayerNew,
    this.text,
  });

  dynamic textToSpeech;
  dynamic recordedPathNew;
  // dynamic audioModel;
  // dynamic audioPlayerNew;
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

  void playAudioFunction() async {
    String textController;

    // 1st ...
    if (widget.recordedPathNew['audioPath'] != null) {
      try {
        await audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(widget.recordedPathNew['audioPath']),
          ),
        );
        audioPlayer.play();
      } on Exception {
        log('Cannot access recorded audio');
      }
    }

    // 3rd ...
    else if (widget.textToSpeech['textController'] != null) {
      // Play text-to-speech
      try {
        textController = widget.textToSpeech['textController'];
        String text = textController;
        await flutterTts.speak(text);
        await flutterTts.setLanguage('en-US');
        await flutterTts.setPitch(1);
        await flutterTts.setVolume(1);
        await flutterTts.setSpeechRate(1);
        await flutterTts.setPitch(1);
        setState(() => isPlaying = true);
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
              value: position.inSeconds.toDouble(),
              max: duration.inSeconds.toDouble(),
              activeColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() async {
                  Duration duration = Duration(seconds: value.toInt());
                  await audioPlayer.seek(duration);
                  value = value;
                });
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
                    playAudioFunction();
                  }

                  setState(() => isPlaying = !isPlaying);
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





//  audio from device 

 // // 2nd ...
    // if (widget.audioPlayerNew['audioModel'] != null) {
    //   print('NOT NULL  ${widget.audioPlayerNew['audioModel']}');
    //   // final contentUri = Uri.parse(widget.audioModel['audioModel']);
    //   // final fileUri = await getApplicationDocumentsDirectory()
    //   //     .then((dir) => dir.uri.resolve(contentUri.pathSegments.last));

    //   // widget.audioFunction['audioFunction'];
    //   // setState(() => isPlaying = true);

    //   // void playSong() {
    //   try {
    //     audioPlayer.setAudioSource(
    //       AudioSource.uri(Uri.parse(widget.audioModel.uri!)),
    //     );
    //     audioPlayer.play();
    //     setState(() => isPlaying = true);
    //   } on Exception {
    //     // print(e.toString());
    //     log('Error parsing audio');
    //   }
    //   // }
    //   // await audioPlayer.setAudioSource(
    //   //     AudioSource.uri(Uri.parse(uri!))); // Use class-level audioPlayer
    //   // await audioPlayer.play();
    //   // setState(() => isPlaying = true);
    // }