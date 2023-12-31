import 'package:flutter/material.dart';
import 'package:funny_voice_changer/src/routes/routes_name.dart';
import 'package:funny_voice_changer/src/utils/my_card.dart';

class LanguagesScreen1 extends StatefulWidget {
  const LanguagesScreen1({super.key});

  @override
  State<LanguagesScreen1> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen1> {
  bool isSelected = false;
  ButtonValuesEnum? _buttonValues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Language',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, RoutesName.onBoardScreen);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          MyCard(
            imagePath: 'assets/england.jpeg',
            title: 'English',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value1,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/spanish.jpeg',
            title: 'Español (Spanish)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value2,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/france.png',
            title: 'française (French)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value3,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/germany.png',
            title: 'Deutsch (German)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value4,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/india.png',
            title: 'हिंदी (Hindi)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value5,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/portugues.png',
            title: 'Português (Portuguese)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value6,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
          MyCard(
            imagePath: 'assets/italian.png',
            title: 'Italiano (Italian)',
            newRadio: NewRadio(
              value: ButtonValuesEnum.value7,
              selectedButtonValues: _buttonValues,
              onChanged: (val) {
                setState(() {
                  _buttonValues = val;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
