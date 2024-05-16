import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/global_cached_image_widget.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import 'package:free_2_play/pages/home/game_detail_page.dart';
import 'package:free_2_play/constant/color_constant.dart';
import 'package:free_2_play/pages/widgets/global_text_widget.dart';
import '../../../main.dart';
import '../../../models/game_list_model.dart';

class GameListWidget extends StatelessWidget {
  final List<GameListModel> games;

  const GameListWidget({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const SliverToBoxAdapter(
        child: GlobalLoadingWidget(),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var game = games[index];
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
              color: ColorConstant.backgroundColor5,
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
                    child: GlobalCachedImage(gameUrl: game.thumbnail),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalTextWidget(
                        text: game.title,
                        color: ColorConstant.primaryTextColor,
                      ),
                      game.platform == "PC (Windows)"
                          ? const Icon(
                              Icons.window_sharp,
                              color: ColorConstant.accentTextColor,
                              size: 16,
                            )
                          : const Icon(
                              Icons.browser_updated_sharp,
                              color: ColorConstant.accentTextColor,
                              size: 16,
                            ),
                      GlobalTextWidget(
                        text: game.genre,
                        color: ColorConstant.accentTextColor,
                        fontSize: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        childCount: games.length,
      ),
    );
  }
}
