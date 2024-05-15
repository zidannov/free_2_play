import 'package:flutter/material.dart';
import 'package:free_2_play/pages/home/widgets/game_newest_widget.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import 'package:free_2_play/pages/widgets/global_text_widget.dart';
import '../../constant/color_constant.dart';
import 'widgets/game_list_widget.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor4,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const GlobalLoadingWidget();
        } else {
          return CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: GlobalTextWidget(
                      text: 'NEW RELEASES',
                      fontSize: 16,
                    )),
              ),
              GameNewestWidget(games: controller.newestGames),
              GameListWidget(games: controller.allGames),
            ],
          );
        }
      }),
    );
  }
}
