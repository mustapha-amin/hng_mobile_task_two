import 'package:flutter/material.dart';

class CustomSegmentedButton extends StatefulWidget {
  Color? containerColor, titleAndIconColor;
  IconData? iconData;
  String? title;
  CustomSegmentedButton(
      {this.containerColor,
      this.titleAndIconColor,
      this.iconData,
      this.title,
      super.key});

  @override
  State<CustomSegmentedButton> createState() => _CustomSegmentedButtonState();
}

class _CustomSegmentedButtonState extends State<CustomSegmentedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.iconData,
            color: widget.titleAndIconColor,
          ),
          Text(
            widget.title!,
            style: TextStyle(color: widget.titleAndIconColor),
          ),
        ],
      ),
    );
  }
}
