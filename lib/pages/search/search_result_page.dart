import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import 'package:get/get.dart';
import '../../../controllers/search_result_controller.dart';
import '../../main.dart';
import '../../constant/color_constant.dart';
import '../home/game_detail_page.dart';
import '../widgets/global_cached_image_widget.dart';
import '../widgets/global_text_widget.dart';

class SearchResultPage extends StatelessWidget {
  final String category;

  const SearchResultPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final SearchResultController controller = Get.put(SearchResultController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchGamesByCategory(category);
    });

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor4,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const GlobalLoadingWidget();
        } else if (controller.games.isEmpty) {
          return const Center(child: Text('No games found'));
        } else {
          return ListView.builder(
            itemCount: controller.games.length,
            itemBuilder: (context, index) {
              var game = controller.games[index];
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
                  height: 62,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  color: ColorConstant.backgroundColor5,
                  margin: const EdgeInsets.only(
                    top: 8,
                    right: 8,
                    left: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        color: Colors.blue,
                        width: 128,
                        height: 42,
                        child: GlobalCachedImage(
                          gameUrl: game.thumbnail,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalTextWidget(
                            text: game.title,
                            color: ColorConstant.primaryTextColor,
                          ),
                          game.platform == "PC (Windows)"
                              ? const Icon(
                                  Icons.window_sharp,
                                  color: ColorConstant.accentTextColor,
                                  size: 16,
                                )
                              : const Icon(
                                  Icons.browser_updated_sharp,
                                  color: ColorConstant.accentTextColor,
                                  size: 16,
                                ),
                          GlobalTextWidget(
                            text: game.genre,
                            color: ColorConstant.accentTextColor,
                            fontSize: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: ColorConstant.primaryColor,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorConstant.primaryTextColor2,
        ),
      ),
    );
  }
}
