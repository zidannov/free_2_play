import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontFamily = 'Motiva Sans',
    this.color = AppColors.primaryTextColor,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
