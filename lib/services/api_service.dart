import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/games_model.dart';

class ApiService {
  final String baseUrl = dotenv.env['BASE_URL']!;
  final String apiKey = dotenv.env['RAPIDAPI_KEY']!;
  final String apiHost = dotenv.env['RAPIDAPI_HOST']!;

  Future<List<GameListModel>> fetchGames() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': apiHost,
        },
      );

      if (response.statusCode == 200) {
        return gameListModelFromJson(response.body);
      } else {
        throw Exception(
          'Failed to load games: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to load games: $e');
    }
  }
}
