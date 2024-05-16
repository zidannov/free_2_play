import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import '../../../controllers/game_similar_controller.dart';
import '../../widgets/global_cached_image_widget.dart';
import '../game_detail_page.dart';
import 'package:get/get.dart';

class GameSimilarWidget extends StatelessWidget {
  final String category;
  const GameSimilarWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameSimilarController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchGamesByCategory(category);
    });

    return Obx(() {
      if (controller.isLoading.value) {
        return const GlobalLoadingWidget();
      } else if (controller.errorMessage.isNotEmpty) {
        return Text(controller.errorMessage.value);
      } else {
        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.gameList.length,
            itemBuilder: (context, index) {
              var game = controller.gameList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameDetailPage(
                        gameId: game.id,
                        category: category,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: GlobalCachedImage(
                            gameUrl: game.thumbnail,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
