import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/custom_text_widget.dart';
import 'package:free_2_play/services/game_service.dart';
import '../../models/game_list_model.dart';
import '../../utils/app_colors.dart';
import '../game_detail_page.dart';

class GameListWidget extends StatelessWidget {
  const GameListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GameService gameService = GameService();

    return FutureBuilder<List<GameListModel>>(
      future: gameService.fetchGames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text("Error: ${snapshot.error.toString()}"),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const SliverToBoxAdapter(child: Text("No games found."));
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var game = snapshot.data![index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
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
                      color: const Color(0xFF203648),
                      margin: const EdgeInsets.only(
                        bottom: 8,
                        right: 8,
                        left: 8,
                      ),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              color: Colors.blue,
                              width: 128,
                              height: 42,
                              child: Image.network(
                                game.thumbnail,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  text: game.title,
                                  color: AppColors.primaryTextColor,
                                ),
                                const Icon(
                                  Icons.window_sharp,
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
                    ));
              },
              childCount: snapshot.data?.length ?? 0,
            ),
          );
        } else {
          return const SliverToBoxAdapter(child: Text("Waiting for games..."));
        }
      },
    );
  }
}
