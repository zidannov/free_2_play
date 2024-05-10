import 'package:flutter/material.dart';
import 'package:free_2_play/pages/home/widgets/game_similar_widget.dart';
import 'package:free_2_play/pages/view_page.dart';
import 'package:free_2_play/utils/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../models/game_detail_model.dart';
import '../../../services/game_service.dart';
import '../home_page.dart';
import '../../widgets/custom_text_widget.dart';
import 'game_detail_carousel.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  final String category;

  const GameDetailPage(
      {super.key, required this.gameId, required this.category});

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
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
              appBar: AppBar(
                automaticallyImplyLeading: false,
                // centerTitle: true,
                title: Image.asset(
                  // color: AppColors.primaryTextColor3,
                  'assets/logos/logo.png',
                  width: 154,
                ),

                centerTitle: true,
                backgroundColor: AppColors.primaryColor,
                elevation: 0,
              ),
              backgroundColor: AppColors.backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      game.thumbnail,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: game.title,
                            fontSize: 26,
                            fontFamily: 'Motiva Sans',
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: 'Developer',
                                      fontSize: 13,
                                      color: AppColors.accentTextColor,
                                    ),
                                    CustomTextWidget(
                                      text: 'Publisher',
                                      fontSize: 13,
                                      color: AppColors.accentTextColor,
                                    ),
                                    CustomTextWidget(
                                      text: 'Released',
                                      fontSize: 13,
                                      color: AppColors.accentTextColor,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: game.developer,
                                      fontSize: 13,
                                      color: AppColors.primaryTextColor2,
                                    ),
                                    CustomTextWidget(
                                      text: game.publisher,
                                      fontSize: 13,
                                      color: AppColors.primaryTextColor2,
                                    ),
                                    CustomTextWidget(
                                      text: game.releaseDate,
                                      fontSize: 13,
                                      color: AppColors.primaryTextColor3,
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
                            screenshots: game.screenshots,
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
                                    const CustomTextWidget(
                                      text: 'PLATFORM',
                                      fontSize: 16,
                                      color: AppColors.accentTextColor,
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
                                      child: CustomTextWidget(
                                        text: game.platform,
                                        color: AppColors.primaryTextColor2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextWidget(
                                      text: 'GENRE',
                                      fontSize: 16,
                                      color: AppColors.accentTextColor,
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
                                      child: CustomTextWidget(
                                        text: game.genre,
                                        color: AppColors.primaryTextColor2,
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
                          CustomTextWidget(
                            text: game.description,
                            fontSize: 12,
                            color: AppColors.primaryTextColor3,
                          ),
                          const SizedBox(height: 24),
                          const CustomTextWidget(
                            text: 'SIMILAR GAMES',
                            fontSize: 16,
                            color: AppColors.accentTextColor,
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
              bottomNavigationBar: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrlString(
                          game.gameUrl,
                          mode: LaunchMode.inAppWebView,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(),
                        ),
                        fixedSize: const Size(270, 64),
                      ),
                      child: const CustomTextWidget(
                        text: 'VISIT THE WEBSITE',
                        fontSize: 16,
                        color: AppColors.primaryTextColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ViewPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          // NOTE!
                          side: const BorderSide(),
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
                child: CustomTextWidget(
                  text: 'Failed to load game details: ${snapshot.error}',
                  color: Colors.red,
                ),
              ),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
