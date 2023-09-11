import 'package:flutter/material.dart';

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
      title: Text(title!),
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            action;
            Navigator.of(context).pop();
          },
          child: Text(actionTitle!),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(dismissalTitle!),
        ),
      ],
    );
  }
}
