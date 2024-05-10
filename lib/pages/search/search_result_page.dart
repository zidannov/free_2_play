import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/custom_loading_widget.dart';
import 'package:get/get.dart';
import '../../../controllers/search_result_controller.dart';
import '../../main.dart';
import '../../utils/app_colors.dart';
import '../home/widgets/game_detail_page.dart';
import '../widgets/custom_text_widget.dart';

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
      backgroundColor: AppColors.backgroundColor4,
      body: Obx(() {
        if (controller.isLoading.value) {
          return CustomLoadingWidget();
        } else if (controller.games.isEmpty) {
          return Center(child: Text('No games found'));
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
                  color: AppColors.backgroundColor5,
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
                        child: Image.network(
                          game.thumbnail,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: game.title,
                            color: AppColors.primaryTextColor,
                          ),
                          game.platform == "PC (Windows)"
                              ? const Icon(
                                  Icons.window_sharp,
                                  color: AppColors.accentTextColor,
                                  size: 16,
                                )
                              : const Icon(
                                  Icons.browser_updated_sharp,
                                  color: AppColors.accentTextColor,
                                  size: 16,
                                ),
                          CustomTextWidget(
                            text: game.genre,
                            color: AppColors.accentTextColor,
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
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primaryTextColor2,
        ),
      ),
    );
  }
}
