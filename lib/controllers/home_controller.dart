import 'package:get/get.dart';
import '../../../models/game_list_model.dart';
import '../../../services/game_service.dart';

class HomeController extends GetxController {
  var newestGames = <GameListModel>[].obs;
  var allGames = <GameListModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    isLoading(true);
    try {
      var fetchedNewestGames =
          await GameService().fetchGamesSortedByReleaseDate();
      var fetchedAllGames = await GameService().fetchGames();
      newestGames.assignAll(fetchedNewestGames);
      allGames.assignAll(fetchedAllGames);
    } finally {
      isLoading(false);
    }
  }
}
