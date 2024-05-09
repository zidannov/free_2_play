import 'package:flutter/material.dart';
import 'package:free_2_play/utils/app_colors.dart';
import '../../models/game_list_model.dart';
import '../../services/game_service.dart';
import '../game_detail_page.dart';
import 'custom_text_widget.dart';

class GameNewestWidget extends StatelessWidget {
  const GameNewestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GameService gameService = GameService();

    return SliverToBoxAdapter(
      child: FutureBuilder<List<GameListModel>>(
        future: gameService.fetchGamesSortedByReleaseDate(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 8,
                  bottom: 8,
                ),
                child: SizedBox(
                  height: 175,
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
                              stops: [
                                0.5,
                                1,
                              ],
                              colors: [
                                AppColors.primaryColor,
                                AppColors.backgroundColor3,
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
                                  left: 8,
                                  top: 4,
                                  bottom: 12,
                                ),
                                child: CustomTextWidget(
                                    text: game.title,
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Text('No data available');
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
