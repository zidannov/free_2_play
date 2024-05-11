import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 56.0;
  final bool changeShadow;

  const CustomAppBar({super.key, this.changeShadow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: changeShadow
            ? [
                BoxShadow(
                  color: AppColors.primaryTextColor2.withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, -2),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ],
      ),
      child: AppBar(
        surfaceTintColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/logos/logo.png',
          width: 154,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
