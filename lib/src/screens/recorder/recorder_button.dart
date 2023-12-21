import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class RecorderButton extends StatefulWidget {
  const RecorderButton({super.key});

  @override
  State<RecorderButton> createState() => _RecorderButtonState();
}

class _RecorderButtonState extends State<RecorderButton> {
  int recordingCounter = 0;
  final recorder = FlutterSoundRecorder();
  bool isRecoderReady = false;
  String? recordedPath;

  Future record() async {
    if (!isRecoderReady) return;

    // Get the chosen storage directory
    final directory = await getApplicationDocumentsDirectory();
    // Create a unique filename
    final filename = 'recording_${recordingCounter++}.aac';
    // Combine directory and filename to form the full path
    final filePath = '${directory.path}/$filename';
    // Start recording using the full path
    await recorder.startRecorder(toFile: filePath);
    // Update recordedPath variable
    recordedPath = filePath;
  }

  Future stop() async {
    if (!isRecoderReady) return;

    final path = await recorder.stopRecorder();
    recordedPath = path; // Store the path in the variable
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
                onPressed: () {
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
                        recorder.isRecording ? Icons.stop : Icons.mic,
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
                    if (recordedPath != null &&
                        File(recordedPath!).existsSync()) {
                      print('Path Send - $recordedPath');
                      Navigator.pushNamed(
                        context,
                        RoutesName.audioPlayerMainScreen,
                        arguments: {
                          'Path': 'Send',
                          'audioPath': recordedPath,
                        },
                      );
                    } else {
                      print('Invalid recorded path or file does not exist.');
                    }
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
