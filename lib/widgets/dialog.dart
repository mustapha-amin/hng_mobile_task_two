import 'package:flutter/material.dart';

import '../utils/textstyle.dart';

class CustomAlertDialog extends StatelessWidget {
  String? title;
  Widget? content;
  VoidCallback? action;
  String? actionTitle;
  String? dismissalTitle;

  CustomAlertDialog({
    this.title,
    this.content,
    this.action,
    this.actionTitle,
    this.dismissalTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title!,
        style: kTextStyle(20, isBold: true),
      ),
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            action;
            Navigator.of(context).pop();
          },
          child: Text(
            actionTitle!,
            style: kTextStyle(15),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            dismissalTitle!,
            style: kTextStyle(15).copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
