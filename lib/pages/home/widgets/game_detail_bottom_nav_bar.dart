import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constant/color_constant.dart';
import '../../main_navigation_page.dart';
import '../../widgets/global_text_widget.dart';

class GameDetailBottomNavBar extends StatelessWidget {
  final dynamic game;

  GameDetailBottomNavBar({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              launchUrlString(
                game.gameUrl, // Pastikan gameUrl adalah properti yang valid dari objek game
                mode: LaunchMode.inAppWebView,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.backgroundColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fixedSize: const Size(270, 64),
            ),
            child: const GlobalTextWidget(
              text: 'VISIT THE WEBSITE',
              fontSize: 16,
              color: ColorConstant.primaryTextColor2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigationPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstant.backgroundColor3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fixedSize: const Size(64, 64),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: ColorConstant.primaryTextColor2,
            ),
          ),
        ],
      ),
    );
  }
}
