import 'package:get/get.dart';
import '../../../services/game_service.dart';

class SearchListController extends GetxController {
  var categories = [
    "Shooter",
    "MMORPG",
    "MOBA",
    "Sports",
    "Social",
    "Strategy",
    "Battle Royale",
    "Card",
    "Card Game",
    "Fantasy",
    "Fighting",
    "MMO",
    "MMOARPG",
    "MMORPG",
    "Racing",
    "Action",
    "Action Game",
    "Action RPG",
    "ARPG",
  ].obs;

  var thumbnailUrls = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllThumbnails();
  }

  void fetchAllThumbnails() async {
    isLoading(true);
    try {
      List<String> urls = [];
      for (String category in categories) {
        String url = await GameService().fetchFirstThumbnail(category);
        urls.add(url);
      }
      thumbnailUrls.assignAll(urls);
    } finally {
      isLoading(false);
    }
  }
}
