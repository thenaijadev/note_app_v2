import 'package:flutter/material.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = AppColors.titleBlack,
      this.textAlign});
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: "neueplak"),
    );
  }
}
