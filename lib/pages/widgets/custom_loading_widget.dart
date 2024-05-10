import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color color;

  const CustomLoadingWidget({
    super.key,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      width: double.infinity,
      height: 128,
      child: const CircularProgressIndicator(
        color: AppColors.primaryTextColor,
      ),
    );
  }
}
