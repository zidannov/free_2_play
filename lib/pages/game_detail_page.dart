import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/similar_games_widget.dart';
import 'package:free_2_play/utils/app_colors.dart';
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
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryTextColor,
                              // fontFamily:
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.releaseDate,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.accentTextColor,
                                  // fontFamily:
                                ),
                              ),
                              Text(
                                snapshot.data!.developer,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.accentTextColor,
                                  // fontFamily:
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
                                      'Platform',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.black,
                                            Colors.transparent,
                                          ], // Warna gradient
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Text(
                                        snapshot.data!.platform,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Genre',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.black,
                                            Colors.transparent,
                                          ], // Warna gradient
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                      child: Text(
                                        snapshot.data!.genre,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: AppColors.backgroundColor2,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            snapshot.data!.description,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryTextColor2,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Similar Games',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryTextColor,
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: const Size(290, 64),
                      ),
                      child: const Text(
                        'Visit The Website',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.accentColor,
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
                        backgroundColor: AppColors.primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: const Size(64, 64),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.accentColor,
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
