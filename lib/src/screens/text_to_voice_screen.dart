// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class TextToVoiceScreen extends StatefulWidget {
//   const TextToVoiceScreen({super.key});

//   @override
//   State<TextToVoiceScreen> createState() => _TextToVoiceScreenState();
// }

// class _TextToVoiceScreenState extends State<TextToVoiceScreen> {

//   @override
// void initState() {
//   super.initState();
//   FlutterTts().initialize();
// }

//   TextEditingController textEditingController = TextEditingController();
//   FlutterTts flutterTts = FlutterTts();

//    textToSpeech(String text) async {
//     await flutterTts.setLanguage("en-US");
//     // await flutterTts.setVolume(0.5);
//     // await flutterTts.setSpeechRate(0.5);
//     await flutterTts.setPitch(1);
//     await flutterTts.speak(text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         title: const Text('Text to Voice'),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {
//               textToSpeech(textEditingController.text);
//             },
//             icon: const Icon(
//               Icons.check,
//               color: Colors.red,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Enter your text:',
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               padding: const EdgeInsets.all(10),
//               width: double.infinity,
//               height: 300,
//               // color: Colors.red,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextField(
//                 controller: textEditingController,
//                 maxLines: 20,
//                 decoration: const InputDecoration(
//                   hintText:
//                       'Enter text to generate audio, then add voice effects',
//                   hintStyle: TextStyle(
//                     color: Colors.black26,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToVoiceScreen extends StatefulWidget {
  const TextToVoiceScreen({super.key});

  @override
  State<TextToVoiceScreen> createState() => _TextToVoiceScreenState();
}

class _TextToVoiceScreenState extends State<TextToVoiceScreen> {
  final TextEditingController textEditingController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    FlutterTts(); // Initialize the plugin
  }

  void textToSpeech(String text) async {
    await flutterTts.setLanguage("en-US");
    // You can uncomment these lines if you want to adjust volume and speech rate
    // await flutterTts.setVolume(0.5);
    // await flutterTts.setSpeechRate(0.5);

    await flutterTts.setPitch(1.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Text to Voice'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              textToSpeech(textEditingController.text);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your text:',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: textEditingController,
                maxLines: 20,
                decoration: const InputDecoration(
                  hintText:
                      'Enter text to generate audio, then add voice effects',
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
