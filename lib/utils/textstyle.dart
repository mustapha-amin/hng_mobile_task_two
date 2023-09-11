import 'package:flutter/material.dart';

TextStyle kTextStyle(double fontSize, {bool? isBold}) {
  isBold ??= false;
  return TextStyle(
    fontSize: fontSize,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: 'Montserrat',
  );
}
