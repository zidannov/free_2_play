import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:free_2_play/pages/gemini/gemini_page.dart';
import 'package:free_2_play/services/api_service.dart';

void main() {
  group('GeminiPage Tests', () {
    setUpAll(() async {
      await dotenv.load(fileName: ".env");
      Gemini.init(
        apiKey: ApiService().geminiApi,
      );
    });

    testWidgets('displays welcome message on load',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: GeminiPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(
          find.text(
              "Selamat datang! Saya adalah asisten virtual Anda. Silakan ajukan pertanyaan mengenai game."),
          findsOneWidget);
    });
  });
}
