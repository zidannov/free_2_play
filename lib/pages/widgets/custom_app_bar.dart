import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 56.0;

  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/logos/logo.png',
        width: 154,
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
