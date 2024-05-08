import 'package:flutter/material.dart';
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
                return Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    leading: Image.network(game.thumbnail),
                    title: Text(
                      game.title,
                      style: const TextStyle(color: AppColors.primaryTextColor),
                    ),
                    subtitle: Text(
                      game.genre,
                      style: const TextStyle(color: AppColors.accentTextColor),
                    ),
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
                  ),
                );
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
