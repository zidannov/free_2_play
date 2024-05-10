import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:free_2_play/pages/widgets/custom_text_widget.dart';
import '../../../controllers/search_list_controller.dart';
import '../search_result_page.dart';

class SearchListWidget extends StatelessWidget {
  final SearchListController controller = Get.put(SearchListController());

  final List<Color> colors = [
    const Color.fromARGB(184, 134, 1, 1), // Merah
    const Color.fromARGB(184, 1, 1, 134), // Biru
    const Color.fromARGB(184, 134, 134, 1), // Kuning
    const Color.fromARGB(184, 1, 134, 1), // Hijau
    const Color.fromARGB(184, 1, 134, 134), // Cyan
    const Color.fromARGB(184, 134, 1, 134), // Pink
    const Color.fromARGB(184, 255, 87, 34), // Orange
  ];

  SearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const CircularProgressIndicator();
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
            return buildCategoryItem(
                context,
                index,
                controller.categories[index],
                controller.thumbnailUrls[index],
                colors[index % colors.length]);
          },
        );
      }
    });
  }

  Widget buildCategoryItem(
    BuildContext context,
    int index,
    String category,
    String thumbnailUrl,
    Color backgroundColor,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultPage(category: category),
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    backgroundColor.withOpacity(1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomTextWidget(
                  text: category.toUpperCase(),
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
