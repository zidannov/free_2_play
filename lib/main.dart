import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:free_2_play/pages/splash/splash_page.dart';
import 'package:free_2_play/services/api_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Gemini.init(
      apiKey: ApiService().geminiApi,
    );
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(canvasColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
