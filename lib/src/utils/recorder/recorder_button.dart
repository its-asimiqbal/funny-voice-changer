import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:funny_voice_changer/src/utils/recorder/audio_player.dart';
import 'package:permission_handler/permission_handler.dart';

class RecorderButton extends StatefulWidget {
  const RecorderButton({super.key});

  @override
  State<RecorderButton> createState() => _RecorderButtonState();
}

class _RecorderButtonState extends State<RecorderButton> {
  int recordingCounter = 0;
  final recorder = FlutterSoundRecorder();
  bool isRecoderReady = false;

  Future record() async {
    if (!isRecoderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecoderReady) return;

    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print('Recorded audio : $audioFile');
    // Reset recording counter
    recordingCounter = 0;
  }

  @override
  void initState() {
    super.initState();
    initRecoder();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.closeRecorder();
  }

  Future initRecoder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }

    await recorder.openRecorder();

    isRecoderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder(
          stream: recorder.onProgress,
          builder: (context, snapshot) {
            final duration =
                snapshot.hasData ? snapshot.data!.duration : Duration.zero;

            return Text(
              '${duration.inSeconds} s',
              style: const TextStyle(
                fontSize: 25,
              ),
            );
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: ()  {
                  print('Reset button clicked');
                },
                icon: const Icon(
                  Icons.restore,
                  color: Colors.white,
                ),
                iconSize: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 30,
                  child: Center(
                    child: IconButton(
                      onPressed: () async {
                        if (recorder.isRecording) {
                          await stop();
                        } else {
                          await record();
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        recorder.isRecording ? Icons.circle : Icons.mic,
                        color: Colors.white,
                      ),
                      iconSize: 35,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AudioPlayerScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.start,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
