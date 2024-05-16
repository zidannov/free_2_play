import 'package:flutter/material.dart';
import 'package:free_2_play/pages/home/widgets/game_detail_bottom_nav_bar.dart';
import 'package:free_2_play/pages/home/widgets/game_detail_floating_text.dart';
import 'package:free_2_play/pages/home/widgets/game_similar_widget.dart';
import 'package:free_2_play/pages/widgets/global_app_bar_widget.dart';
import 'package:free_2_play/pages/widgets/global_cached_image_widget.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import 'package:free_2_play/constant/color_constant.dart';
import '../../models/game_detail_model.dart';
import '../../services/game_service.dart';
import '../widgets/global_text_widget.dart';
import 'widgets/game_detail_carousel.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  final String category;

  const GameDetailPage(
      {super.key, required this.gameId, required this.category});

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GameDetailModel>(
      future: GameService().fetchGameDetailById(widget.gameId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final game = snapshot.data!;
            return Scaffold(
              backgroundColor: ColorConstant.backgroundColor,
              appBar: const GlobalAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalCachedImage(
                      gameUrl: game.thumbnail,
                      widthQuery: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalTextWidget(
                            text: game.title,
                            fontSize: 26,
                            fontFamily: 'Motiva Sans',
                            fontWeight: FontWeight.bold,
                            color: ColorConstant.primaryTextColor,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalTextWidget(
                                      text: 'Developer',
                                      fontSize: 13,
                                      color: ColorConstant.accentTextColor,
                                    ),
                                    GlobalTextWidget(
                                      text: 'Publisher',
                                      fontSize: 13,
                                      color: ColorConstant.accentTextColor,
                                    ),
                                    GlobalTextWidget(
                                      text: 'Released',
                                      fontSize: 13,
                                      color: ColorConstant.accentTextColor,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalTextWidget(
                                      text: game.developer,
                                      fontSize: 13,
                                      color: ColorConstant.primaryTextColor2,
                                    ),
                                    GlobalTextWidget(
                                      text: game.publisher,
                                      fontSize: 13,
                                      color: ColorConstant.primaryTextColor2,
                                    ),
                                    GlobalTextWidget(
                                      text: game.releaseDate,
                                      fontSize: 13,
                                      color: ColorConstant.primaryTextColor3,
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
                            color: ColorConstant.backgroundColor2,
                          ),
                          const SizedBox(height: 20),
                          GameDetailCarousel(
                            screenshots: game.screenshots,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: ColorConstant.backgroundColor2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              GameDetailFloatingText(
                                game: game.platform,
                                text: 'PLATFORM',
                              ),
                              GameDetailFloatingText(
                                game: game.genre,
                                text: 'GENRE',
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 0.2,
                            color: ColorConstant.backgroundColor2,
                          ),
                          const SizedBox(height: 16),
                          GlobalTextWidget(
                            text: game.description,
                            fontSize: 12,
                            color: ColorConstant.primaryTextColor3,
                          ),
                          const SizedBox(height: 24),
                          const GlobalTextWidget(
                            text: 'SIMILAR GAMES',
                            fontSize: 16,
                            color: ColorConstant.accentTextColor,
                          ),
                          const SizedBox(height: 16),
                          GameSimilarWidget(
                            category: game.genre,
                          ),
                          const SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              extendBody: true,
              bottomNavigationBar: GameDetailBottomNavBar(game: game.gameUrl),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('Failed to load game details: ${snapshot.error}'),
              ),
            );
          }
        }
        return const Scaffold(
          backgroundColor: ColorConstant.backgroundColor,
          appBar: GlobalAppBar(),
          body: GlobalLoadingWidget(
            color: ColorConstant.backgroundColor,
          ),
        );
      },
    );
  }
}
