import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/game_newest_controller.dart';
import '../../../main.dart';
import 'game_detail_page.dart';
import '../../widgets/custom_text_widget.dart';
import '../../../utils/app_colors.dart';

class GameNewestWidget extends StatelessWidget {
  final GameNewestController controller = Get.put(GameNewestController());

  GameNewestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const SliverToBoxAdapter();
      } else {
        return SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            child: SizedBox(
              height: 175,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.games.length,
                itemBuilder: (context, index) {
                  var game = controller.games[index];
                  return GestureDetector(
                    onTap: () {
                      navigatorKey.currentState?.push(
                        MaterialPageRoute(
                          builder: (context) => GameDetailPage(
                            gameId: game.id,
                            category: game.genre,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.5, 1],
                          colors: [
                            AppColors.primaryColor,
                            AppColors.backgroundColor3
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Image.network(
                                game.thumbnail,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 4, bottom: 12),
                            child: CustomTextWidget(
                              text: game.title,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }
    });
  }
}
