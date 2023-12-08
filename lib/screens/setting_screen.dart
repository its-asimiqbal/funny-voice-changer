import 'dart:io';

import 'package:flutter/material.dart';
import 'package:funny_voice_changer/screens/language_screen2.dart';
import 'package:funny_voice_changer/screens/languages_screen1.dart';
import 'package:funny_voice_changer/utils/demo.dart';
import 'package:url_launcher/url_launcher.dart';

import 'privacy_policy_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int selectedIndex = 0;

  Future<void> showCustomDialog() {
    return showDialog(
      context: context,
      builder: (context) => const FeedbackAndBugReportDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Setting'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Upgrade Pro-version',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.diamond,
              color: Color.fromARGB(255, 107, 161, 254),
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LanguagesScreen2(),
                ),
              );
            },
            child: const Card(
              child: ListTile(
                minLeadingWidth: 0.0,
                leading: Icon(
                  Icons.language,
                  color: Colors.black,
                ),
                title: Text(
                  'Language',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: showCustomDialog,
            child: const Card(
              child: ListTile(
                minLeadingWidth: 0.0,
                leading: Icon(
                  Icons.message,
                  color: Colors.black,
                ),
                title: Text(
                  'Feedback & Bug report',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen(),
                ),
              );
            },
            child: const Card(
              child: ListTile(
                minLeadingWidth: 0.0,
                leading: Icon(
                  Icons.pageview,
                  color: Colors.black,
                ),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Card(
              child: ListTile(
                minLeadingWidth: 0.0,
                leading: Icon(
                  Icons.update,
                  color: Colors.black,
                ),
                title: Text(
                  'Update',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//

// showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return SizedBox(
//                     height: 200,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Update Available!',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 20),
//                         // TextButton(
//                         //   onPressed: () {
//                         //     launchUrl(
//                         //       Uri.parse(
//                         //           'https://play.google.com/store/apps/details?id=com.funny.voicechanger.free.voiceeditor.voiceeffects.soundeffects'),
//                         //     );
//                         //   },
//                         //   child: const Text('Download Update'),
//                         // ),
//                         ElevatedButton(
//                           onPressed: () async {
//                             final uri = Uri.parse(
//                               'https://play.google.com/store/apps/details?id=com.funny.voicechanger.free.voiceeditor.voiceeffects.soundeffects',
//                             );

//                             if (await canLaunchUrl(uri)) {
//                               await launchUrl(uri);
//                             } else {
//                               // Handle the case where the URL cannot be launched
//                               print('Could not launch the URL');
//                             }
//                           },
//                           child: const Text('Open URL'),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );