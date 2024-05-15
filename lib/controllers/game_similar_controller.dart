import 'package:get/get.dart';
import '../models/game_list_model.dart';
import '../services/game_service.dart';

class GameSimilarController extends GetxController {
  var isLoading = true.obs;
  var gameList = <GameListModel>[].obs;
  var errorMessage = ''.obs;

  void fetchGamesByCategory(String category) async {
    try {
      isLoading(true);
      var games = await GameService().fetchGameByCategory(category);
      if (games.isNotEmpty) {
        gameList.assignAll(games);
      } else {
        errorMessage('No data available');
      }
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
