import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import 'custom_loading_widget.dart';

class CustomCachedImage extends StatelessWidget {
  final String gameUrl;
  final BoxFit fit;
  final bool widthQuery;

  const CustomCachedImage({
    super.key,
    required this.gameUrl,
    this.fit = BoxFit.cover,
    this.widthQuery = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: gameUrl,
      fit: fit,
      width: widthQuery ? MediaQuery.of(context).size.width : null,
      placeholder: (context, url) => const SizedBox(
        width: 10,
        height: 10,
        child: CustomLoadingWidget(
          color: AppColors.backgroundColor5,
          strokeWidth: 1,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
