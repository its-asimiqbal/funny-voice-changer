import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  MyCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.value});

  String imagePath;
  String title;
  int value;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  // bool isSelected = false;

  MyCard? _selectedCard;

  // _type keeps track of the selected payment method
  int? _type = 1;
  // _handleRadio is called to update _type, which may trigger changes in the UI based on the selected payment method
  void _handleRadio(Object? e) => setState(() {
        if (_type != e && e != null) {
          _type = e as int;
          _selectedCard = widget;
        } else if (_selectedCard == widget) {
          _type = null;
          _selectedCard = null;
        }
      });

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
          trailing: Radio(
            value: widget.value,
            groupValue: _type,
            onChanged: _handleRadio,
            activeColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}



// trailing: IconButton(
//             icon: Icon(
//               // isSelected
//               //     ? Icons.radio_button_checked
//               //     : Icons.radio_button_unchecked,
//               // color: isSelected ? Colors.deepPurple : Colors.grey,
//               _selectedCard == widget
//                   ? Icons.radio_button_checked
//                   : Icons.radio_button_unchecked,
//               color: _selectedCard == widget ? Colors.deepPurple : Colors.grey,
//             ),
//             onPressed: () {
//               setState(() {
//                 // isSelected = !isSelected;
//                 // _selectedCard = widget;
//                 if (_selectedCard != widget) {
//                   _selectedCard = widget;
//                 } else {
//                   _selectedCard = null; // Clear selection when tapping again
//                 }
//               });
//             },
//           ),