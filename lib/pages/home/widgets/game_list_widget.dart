import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/custom_cached_image.dart';
import 'package:free_2_play/pages/widgets/custom_loading_widget.dart';
import 'package:get/get.dart';
import 'package:free_2_play/controllers/game_list_controller.dart';
import 'package:free_2_play/pages/home/widgets/game_detail_page.dart';
import 'package:free_2_play/utils/app_colors.dart';
import 'package:free_2_play/pages/widgets/custom_text_widget.dart';

import '../../../main.dart';

class GameListWidget extends StatelessWidget {
  final GameListController controller = Get.put(GameListController());

  GameListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.games.isEmpty) {
        return const SliverToBoxAdapter(
          child: CustomLoadingWidget(),
        );
      }
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
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
                height: 62,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                color: AppColors.backgroundColor5,
                margin: const EdgeInsets.only(
                  bottom: 8,
                  right: 8,
                  left: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      color: Colors.blue,
                      width: 128,
                      height: 42,
                      child: CustomCachedImage(gameUrl: game.thumbnail),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: game.title,
                          color: AppColors.primaryTextColor,
                        ),
                        game.platform == "PC (Windows)"
                            ? const Icon(
                                Icons.window_sharp,
                                color: AppColors.accentTextColor,
                                size: 16,
                              )
                            : const Icon(
                                Icons.browser_updated_sharp,
                                color: AppColors.accentTextColor,
                                size: 16,
                              ),
                        CustomTextWidget(
                          text: game.genre,
                          color: AppColors.accentTextColor,
                          fontSize: 12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          childCount: controller.games.length,
        ),
      );
    });
  }
}
