import 'package:flutter/material.dart';
import 'package:free_2_play/constant/color_constant.dart';

class GlobalLoadingWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;

  const GlobalLoadingWidget({
    super.key,
    this.color = Colors.transparent,
    this.strokeWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      width: double.infinity,
      height: 128,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: ColorConstant.primaryTextColor,
      ),
    );
  }
}
