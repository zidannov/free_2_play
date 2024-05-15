import 'package:flutter/material.dart';
import '../../constant/color_constant.dart';
import '../../constant/asset_constant.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 56.0;
  final bool changeShadow;

  const GlobalAppBar({super.key, this.changeShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: changeShadow
            ? [
                BoxShadow(
                  color: ColorConstant.primaryTextColor2.withOpacity(0.4),
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
        surfaceTintColor: ColorConstant.primaryColor,
        automaticallyImplyLeading: false,
        title: Image.asset(
          ImageConstant.appLogo,
          width: 154,
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.primaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
