import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:developer';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen(
      {super.key, required this.audioModel, required this.audioPlayer});

  final SongModel audioModel;
  final AudioPlayer audioPlayer;

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = false;
  Duration duration = const Duration();
  Duration position = const Duration();

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  void playAudio() {
    try {
      widget.audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.audioModel.uri!),
        ),
      );
      widget.audioPlayer.play();
      isPlaying = true;
    } on Exception {
      log('Cannot parse audio');
    }

    widget.audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        duration = newDuration!;
      });
    });
    widget.audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Audio Player',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Center(
                  child: Column(
                    children: [
                      // const CircleAvatar(
                      //   radius: 100,
                      //   child: Icon(
                      //     Icons.music_note,
                      //     size: 80,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      // Text(
                      //   widget.audioModel.displayName,
                      //   style: const TextStyle(fontSize: 20),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Text(
                      //   widget.audioModel.displayNameWOExt,
                      //   style: const TextStyle(fontSize: 20),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Slider(
                        // min: const Duration(microseconds: 0).inSeconds.toDouble(),
                        min: 0,
                        value: position.inSeconds.toDouble(),
                        max: duration.inSeconds.toDouble(),
                        activeColor: Colors.deepPurple,
                        onChanged: (value) {
                          setState(() {
                            Duration duration =
                                Duration(seconds: value.toInt());
                            widget.audioPlayer.seek(duration);
                            value = value;
                          });
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              position.toString().split('.')[0],
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.skip_previous,
                            //     size: 40,
                            //   ),
                            // ),
                      
                            Text(
                              duration.toString().split('.')[0],
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.skip_next,
                            //     size: 40,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepPurple,
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    if (isPlaying) {
                                      widget.audioPlayer.pause();
                                    } else {
                                      widget.audioPlayer.play();
                                    }
                                    isPlaying = !isPlaying;
                                  },
                                );
                              },
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                              iconSize: 40,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
