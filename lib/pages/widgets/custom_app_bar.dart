import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 56.0;
  final bool showShadow;

  const CustomAppBar({super.key, this.showShadow = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ]
            : [],
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
