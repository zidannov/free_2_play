import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constant/color_constant.dart';
import 'global_loading_widget.dart';

class GlobalCachedImage extends StatelessWidget {
  final String gameUrl;
  final BoxFit fit;
  final bool widthQuery;

  const GlobalCachedImage({
    super.key,
    required this.gameUrl,
    this.fit = BoxFit.cover,
    this.widthQuery = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: gameUrl.isNotEmpty
          ? gameUrl
          : "https://www.freetogame.com/g/6/thumbnail.jpg",
      fit: fit,
      width: widthQuery ? MediaQuery.of(context).size.width : null,
      placeholder: (context, url) => const SizedBox(
        width: 10,
        height: 10,
        child: GlobalLoadingWidget(
          color: ColorConstant.backgroundColor5,
          strokeWidth: 1,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
