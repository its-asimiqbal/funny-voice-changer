import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/screens/audio_from_device_screen.dart';
import 'package:funny_voice_changer/src/screens/text_to_voice_screen.dart';

import 'record_audio_screen.dart';
import 'setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Voice Changer',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.deepPurple,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecordAudioScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 170,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 88, 17, 211),
                          Colors.deepPurpleAccent,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.music_off,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Record & Change \n Voice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TextToVoiceScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 24, 3, 60),
                          Colors.deepPurpleAccent,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Text to Voice',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AudioFromDeviceScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 237, 218, 42),
                          Colors.deepOrange,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Audio from device',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 255, 132, 173),
                        Colors.pink,
                      ],
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.audio_file,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Audio saved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
