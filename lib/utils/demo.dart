import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const List<String> _feedbackItems = [
  'The app doesn\'t work well',
  'It took too long to change the voice',
  'I don\'t like the voice effect type',
  'Too many ads',
  'Do not know how to use',
  'Others',
];

class FeedbackAndBugReportDialog extends StatefulWidget {
  const FeedbackAndBugReportDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackAndBugReportDialog> createState() =>
      _FeedbackAndBugReportDialogState();
}

class _FeedbackAndBugReportDialogState
    extends State<FeedbackAndBugReportDialog> {
  String? selectedFeedbackItem;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Feedback & Bug report',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(1, 0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _feedbackItems.length,
              itemBuilder: (context, index) {
                return RadioListTile<String>(
                  value: _feedbackItems[index],
                  groupValue: selectedFeedbackItem,
                  onChanged: (value) {
                    setState(() {
                      selectedFeedbackItem = value;
                    });
                  },
                  title: Text(_feedbackItems[index]),
                  dense: true,
                );
              },
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: "Thanks for your feedback",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black,
                  ); // Add toast message
                },
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
