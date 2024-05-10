import '../models/game_detail_model.dart';
import '../models/game_list_model.dart';
import 'api_service.dart';
import 'package:http/http.dart' as http;

class GameService {
  final ApiService _apiService = ApiService();

  Future<List<GameListModel>> fetchGames() async {
    try {
      final response = await http
          .get(Uri.parse('${_apiService.baseUrl}/api/games'), headers: {
        'x-rapidapi-key': _apiService.apiKey,
        'x-rapidapi-host': _apiService.apiHost
      });

      if (response.statusCode == 200) {
        return gameListModelFromJson(response.body);
      } else {
        throw Exception('Failed to load games: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load games: $e');
    }
  }

  Future<List<GameListModel>> fetchGameByCategory(String category) async {
    List<GameListModel> allGames = await fetchGames();
    return allGames.where((game) => game.genre == category).toList();
  }

  Future<GameDetailModel> fetchGameDetailById(int gameId) async {
    try {
      final response = await http.get(
          Uri.parse('${_apiService.baseUrl}/api/game?id=$gameId'),
          headers: {
            'x-rapidapi-key': _apiService.apiKey,
            'x-rapidapi-host': _apiService.apiHost
          });

      if (response.statusCode == 200) {
        return gameDetailModelFromJson(response.body);
      } else {
        throw Exception(
            'Failed to load game detail with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load game detail: $e');
    }
  }

  Future<List<GameListModel>> fetchGamesSortedByReleaseDate() async {
    try {
      final response = await http.get(
          Uri.parse('${_apiService.baseUrl}/api/games?sort-by=release-date'),
          headers: {
            'x-rapidapi-key': _apiService.apiKey,
            'x-rapidapi-host': _apiService.apiHost
          });

      if (response.statusCode == 200) {
        List<GameListModel> games = gameListModelFromJson(response.body);
        return games.take(10).toList();
      } else {
        throw Exception('Failed to load games: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load games: $e');
    }
  }

  Future<String> fetchFirstThumbnail(String category) async {
    List<GameListModel> allGames = await fetchGameByCategory(category);
    return allGames.first.thumbnail;
  }
}
