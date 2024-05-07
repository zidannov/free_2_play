import '../models/games_model.dart';
import 'api_service.dart';

class GameService {
  final ApiService _apiService = ApiService();

  Future<List<GameListModel>> fetchSimilarGames(String category) async {
    List<GameListModel> allGames = await _apiService.fetchGames();
    return allGames.where((game) => game.genre == category).toList();
  }
}
