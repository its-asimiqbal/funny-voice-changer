import 'package:flutter/material.dart';
import 'package:funny_voice_changer/utils/my_card.dart';

class LanguagesPage extends StatefulWidget {
  const LanguagesPage({super.key});

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Language'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          MyCard(imagePath: 'assets/england.jpeg', title: 'English', value: 1),
          MyCard(imagePath: 'assets/spanish.jpeg', title: 'Español (Spanish)', value: 2),
          MyCard(imagePath: 'assets/france.png', title: 'française (French)', value: 3),
          MyCard(imagePath: 'assets/germany.png', title: 'Deutsch (German)', value: 4),
          MyCard(imagePath: 'assets/india.png', title: 'हिंदी (Hindi)', value: 5),
          MyCard(
              imagePath: 'assets/portugues.png', title: 'Português (Portuguese)', value: 6),
          MyCard(imagePath: 'assets/italian.png', title: 'Italiano (Italian)', value: 7),
        ],
      ),
    );
  }
}
