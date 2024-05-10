import 'package:get/get.dart';
import '../../../models/game_list_model.dart';
import '../../../services/game_service.dart';

class SearchResultController extends GetxController {
  var isLoading = true.obs;
  var games = <GameListModel>[].obs;

  void fetchGamesByCategory(String category) async {
    isLoading(true);
    try {
      var fetchedGames = await GameService().fetchGameByCategory(category);
      games.assignAll(fetchedGames);
    } finally {
      isLoading(false);
    }
  }
}
