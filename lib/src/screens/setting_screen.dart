import 'dart:async';
import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';
import 'package:funny_voice_changer/src/utils/demo.dart';
import 'privacy_policy_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

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
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
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
              Navigator.pushNamed(context, RoutesName.languagesScreen2);
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
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                context: context,
                builder: (context) => const SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Getting app info...',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
