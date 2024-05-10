import 'package:get/get.dart';
import '../../../models/game_list_model.dart';
import '../../../services/game_service.dart';

class GameNewestController extends GetxController {
  var games = <GameListModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    GameService gameService = GameService();
    try {
      isLoading(true);
      var fetchedGames = await gameService.fetchGamesSortedByReleaseDate();
      games.assignAll(fetchedGames);
    } finally {
      isLoading(false);
    }
  }
}
