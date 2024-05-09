import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/similar_games_widget.dart';
import 'package:free_2_play/utils/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../models/game_detail_model.dart';

import '../services/game_service.dart';
import 'home_page.dart';
import 'widgets/game_detail_carousel.dart';

class GameDetailPage extends StatelessWidget {
  final int gameId;
  final String category;

  const GameDetailPage(
      {super.key, required this.gameId, required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GameDetailModel>(
      future: GameService().fetchGameDetailById(gameId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      snapshot.data!.thumbnail,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      // height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryTextColor,
                              // fontFamily:
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Developer',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.accentTextColor,
                                      ),
                                    ),
                                    Text(
                                      'Publisher',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.accentTextColor,
                                      ),
                                    ),
                                    Text(
                                      'Released',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.accentTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.developer,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.primaryTextColor2,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.publisher,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.primaryTextColor2,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data!.releaseDate,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.primaryTextColor3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: AppColors.backgroundColor2,
                          ),
                          const SizedBox(height: 20),
                          GameDetailCarousel(
                            screenshots: snapshot.data!.screenshots,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: AppColors.backgroundColor2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PLATFORM',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.accentTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.backgroundColor3,
                                      ),
                                      child: Text(
                                        snapshot.data!.platform,
                                        style: const TextStyle(
                                            color: AppColors.primaryTextColor2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'GENRE',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.accentTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.backgroundColor3,
                                      ),
                                      child: Text(
                                        snapshot.data!.genre,
                                        style: const TextStyle(
                                          color: AppColors.primaryTextColor2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: AppColors.backgroundColor2,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            snapshot.data!.description,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryTextColor3,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'SIMILAR GAMES',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.accentTextColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SimilarGamesWidget(
                            category: snapshot.data!.genre,
                          ),
                          const SizedBox(height: 34),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrlString(
                          snapshot.data!.gameUrl,
                          mode: LaunchMode.inAppWebView,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: const Size(290, 64),
                      ),
                      child: const Text(
                        'VISIT THE WEBSITE',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryTextColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: const Size(64, 64),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primaryTextColor2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Failed to load game details: ${snapshot.error}'),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
