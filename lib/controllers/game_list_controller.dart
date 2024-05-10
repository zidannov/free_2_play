import 'package:get/get.dart';
import 'package:free_2_play/models/game_list_model.dart';
import 'package:free_2_play/services/game_service.dart';

class GameListController extends GetxController {
  var games = <GameListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchGames();
  }

  void fetchGames() async {
    var fetchedGames = await GameService().fetchGames();

    games.assignAll(fetchedGames);
  }
}
