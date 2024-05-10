import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;

  const CustomLoadingWidget({
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
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
