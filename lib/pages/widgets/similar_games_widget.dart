import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';
import '../../models/game_list_model.dart';
import '../../services/api_service.dart';
import '../../services/game_service.dart';
import '../game_detail_page.dart';

class SimilarGamesWidget extends StatelessWidget {
  Future<List<GameListModel>>? games;
  final String category;

  SimilarGamesWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    GameService gameService = GameService();

    return FutureBuilder<List<GameListModel>>(
      future: gameService.fetchSimilarGames(category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var game = snapshot.data![index];
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
                              child: Image.network(
                                game.thumbnail,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            game.title,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryTextColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Text('No data available');
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFFFFFFF),
            ),
          );
        }
      },
    );
  }
}
