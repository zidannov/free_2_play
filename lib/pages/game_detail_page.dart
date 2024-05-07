import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/similar_game_page.dart';
import '../models/games_model.dart';
import '../services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailPage extends StatelessWidget {
  final GameListModel game;

  const GameDetailPage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              game.thumbnail,
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
                    game.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(game.releaseDate),
                      Text(game.developer),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: const Color(0xFF515151),
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
                                // color: Colors.white,
                              ),
                            ),
                            Chip(
                              label: Text(
                                game.platform,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: const Color(0xFF515151),
                            ),
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
                                // color: Colors.white,
                              ),
                            ),
                            Chip(
                              label: Text(
                                game.genre,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: const Color(0xFF515151),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: const Color(0xFF515151),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    game.shortDescription,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Similar Games',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SimilarGamesWidget(
                    games: ApiService().fetchGames(),
                  ),
                  const SizedBox(height: 34),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          fixedSize: const Size(290, 64),
                        ),
                        child: const Text(
                          'Visit The Website',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50), // Radius pembulatan
                          ),
                          fixedSize: const Size(64, 64),
                        ),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
