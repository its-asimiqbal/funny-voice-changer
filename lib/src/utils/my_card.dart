import 'package:flutter/material.dart';

enum ButtonValues { value1, value2, value3, value4, value5, value6, value7 }

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  MyCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.newRadio});

  String imagePath;
  String title;
  NewRadio? newRadio;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.imagePath,
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(widget.title),
          trailing: widget.newRadio,
        ),
      ),
    );
  }
}

enum ButtonValuesEnum { value1, value2, value3, value4, value5, value6, value7 }

// ignore: must_be_immutable
class NewRadio extends StatelessWidget {
  NewRadio(
      {super.key,
      required this.value,
      required this.selectedButtonValues,
      required this.onChanged});

  ButtonValuesEnum value;
  ButtonValuesEnum? selectedButtonValues;
  Function(ButtonValuesEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Radio<ButtonValuesEnum>(
      value: value,
      groupValue: selectedButtonValues,
      onChanged: onChanged,
      activeColor: Colors.deepPurple,
    );
  }
}
