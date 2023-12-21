import 'package:flutter/material.dart';

enum ButtonValuesEnum { value1, value2, value3, value4, value5, value6, value7 }

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({
    super.key,
  });

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  ButtonValuesEnum? _buttonValues;
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Feedback & Bug report',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              ListTile(
                minLeadingWidth: 0.0,
                contentPadding: EdgeInsets.zero,
                leading: Radio(
                  value: ButtonValuesEnum.value1,
                  groupValue: _buttonValues,
                  onChanged: (val) {
                    setState(() {
                      _buttonValues = val;
                    });
                  },
                ),
                title: const Text("The app doesn't work well"),
              ),
              ListTile(
                minLeadingWidth: 0.0,
                minVerticalPadding: 0.0,
                contentPadding: EdgeInsets.zero,
                leading: Radio(
                  value: ButtonValuesEnum.value2,
                  groupValue: _buttonValues,
                  onChanged: (val) {
                    setState(() {
                      _buttonValues = val;
                    });
                  },
                ),
                title: const Text("The app doesn't  well"),
              ),
              ListTile(
                minLeadingWidth: 0.0,
                contentPadding: EdgeInsets.zero,
                leading: Radio(
                  value: ButtonValuesEnum.value3,
                  groupValue: _buttonValues,
                  onChanged: (val) {
                    setState(() {
                      _buttonValues = val;
                    });
                  },
                ),
                title: const Text("The app doesn't work well"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
