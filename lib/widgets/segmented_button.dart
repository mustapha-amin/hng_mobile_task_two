import 'package:flutter/material.dart';
import 'package:hng_mobile_task_two/models/cv_data.dart';
import 'package:hng_mobile_task_two/utils/textstyle.dart';
import 'package:hng_mobile_task_two/widgets/spacing.dart';

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
          VerticalSpacing(5),
          Text(
            widget.title!,
            style: kTextStyle(14, isBold: true).copyWith(
              color: widget.titleAndIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
