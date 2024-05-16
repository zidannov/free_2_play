import 'package:flutter/material.dart';
import '../../widgets/global_cached_image_widget.dart';
import '../../widgets/global_text_widget.dart';
import '../search_result_page.dart';

class CategoryItemWidget extends StatelessWidget {
  final String category;
  final String thumbnailUrl;
  final Color backgroundColor;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.thumbnailUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GlobalCachedImage(
                gameUrl: thumbnailUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
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
                child: GlobalTextWidget(
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
