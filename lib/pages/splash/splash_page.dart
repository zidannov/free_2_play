import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';
import 'dart:async';

import '../home_page.dart';

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
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.of(context, rootNavigator: true)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/logos/logo.gif',
          height: 425,
          // color: AppColors.primaryTextColor2,
        ),
      ),
    );
  }
}
