import 'package:flutter/material.dart';
import 'package:free_2_play/pages/main_navigation_page.dart';
import 'package:free_2_play/constant/color_constant.dart';
import 'dart:async';

import '../../constant/asset_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainNavigationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryColor,
      body: Center(
        child: Image.asset(
          ImageConstant.appLogoSplash,
          height: 225,
          // color: ColorConstant.primaryTextColor2,
        ),
      ),
    );
  }
}
