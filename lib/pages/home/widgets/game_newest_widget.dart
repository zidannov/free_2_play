import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../models/game_list_model.dart';
import '../game_detail_page.dart';
import '../../widgets/global_text_widget.dart';
import '../../../constant/color_constant.dart';

class GameNewestWidget extends StatelessWidget {
  final List<GameListModel> games;

  const GameNewestWidget({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            itemBuilder: (context, index) {
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
                  margin: const EdgeInsets.only(
                    right: 16,
                    bottom: 6,
                  ),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.8, 1],
                        colors: [
                          ColorConstant.primaryColor,
                          ColorConstant.backgroundColor4
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          blurRadius: 4,
                          offset: const Offset(4, 4),
                        ),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: game.thumbnail,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 4, bottom: 12),
                        child: GlobalTextWidget(
                          text: game.title,
                          color: ColorConstant.primaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
