// import 'package:flutter/material.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';

// class AudioFromDeviceScreen extends StatefulWidget {
//   const AudioFromDeviceScreen({super.key});

//   @override
//   State<AudioFromDeviceScreen> createState() => _AudioFromDeviceScreenState();
// }

// class _AudioFromDeviceScreenState extends State<AudioFromDeviceScreen> {
//   OnAudioQuery? audioQuery;

//   Future<bool> requestPermission() async {
//     final status = await Permission.storage.request();
//     if (status.isGranted) {
//       audioQuery = OnAudioQuery();
//       return true;
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Storage permission required to access audio files.'),
//         ),
//       );
//       return false;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     requestPermission().then((granted) async {
//       if (granted) {
//         // Start querying for songs
//         await audioQuery!.querySongs(
//           sortType: null,
//           orderType: OrderType.ASC_OR_SMALLER,
//           uriType: UriType.EXTERNAL,
//           ignoreCase: true,
//         );
//         setState(() {}); // Update UI after querying songs
//       } else {
//         // Show permission denied message
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Audio from device'),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.search,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<SongModel>>(
//         future: audioQuery?.querySongs(
//           sortType: null,
//           orderType: OrderType.ASC_OR_SMALLER,
//           uriType: UriType.EXTERNAL,
//           ignoreCase: true,
//         ),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             // Handle error
//             return Text('Error: ${snapshot.error}');
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final song = snapshot.data![index]; // initialized "song"
//               return ListTile(
//                 leading: const Icon(Icons.music_note, color: Colors.blue),
//                 title: Text(song.displayName),
//                 subtitle: Row(
//                   children: [
//                     Text(song.duration.toString()),
//                     const SizedBox(width: 20),
//                     Text(song.dateAdded.toString()),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/screens/now_playing_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'dart:developer';

class AudioFromDeviceScreen extends StatefulWidget {
  const AudioFromDeviceScreen({super.key});

  @override
  State<AudioFromDeviceScreen> createState() => _AudioFromDeviceScreenState();
}

class _AudioFromDeviceScreenState extends State<AudioFromDeviceScreen> {
  OnAudioQuery? audioQuery;
  AudioPlayer audioPlayer = AudioPlayer();

  Future<bool> requestPermission() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      audioQuery = OnAudioQuery();
      return true;
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Storage permission required to access audio files.'),
        ),
      );
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermission().then((granted) async {
      if (granted) {
        await audioQuery!.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        );
        setState(() {}); // Update UI after querying songs
      } else {
        // Show permission denied message
      }
    });
  }

  playAudio(String uri) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(uri),
        ),
      );
      audioPlayer.play();
    } on Exception {
      log('Error parsing audio');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio from device'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: audioQuery?.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // Handle error
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var song = snapshot.data![index]; // Initialize "song"
              // Convert duration to standard format
              Duration duration = Duration(milliseconds: song.duration as int);
              String formattedDuration = formatDuration(duration);

              return ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.music_note, color: Colors.white),
                ),
                title: Text(song.displayName),
                subtitle: Text(formattedDuration),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NowPlayingScreen(
                  //       audioModel: snapshot.data![index],
                  //       audioPlayer: audioPlayer,
                  //     ),
                  //   ),
                  // );
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NowPlayingScreen(
                        audioModel: snapshot.data![index],
                        audioPlayer: audioPlayer,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Define `formatDuration` function
String formatDuration(Duration duration) {
  String minutes = duration.inMinutes.toString();
  String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return "$minutes:$seconds";
}
