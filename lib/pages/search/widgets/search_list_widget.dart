import 'package:flutter/material.dart';
import 'package:free_2_play/pages/search/widgets/category_item_widget.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import 'package:get/get.dart';
import '../../../controllers/search_list_controller.dart';
import 'color_palette.dart';

class SearchListWidget extends StatelessWidget {
  final SearchListController controller = Get.put(SearchListController());

  SearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const GlobalLoadingWidget();
      } else {
        return GridView.builder(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryItemWidget(
              category: controller.categories[index],
              thumbnailUrl: controller.thumbnailUrls[index],
              backgroundColor:
                  ColorPalette.colors[index % ColorPalette.colors.length],
            );
          },
        );
      }
    });
  }
}
