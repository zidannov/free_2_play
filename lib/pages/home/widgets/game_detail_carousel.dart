import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:free_2_play/pages/widgets/global_loading_widget.dart';
import '../../../models/game_detail_model.dart';

class GameDetailCarousel extends StatelessWidget {
  final List<Screenshot> screenshots;

  const GameDetailCarousel({super.key, required this.screenshots});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: screenshots.map(
        (screenshot) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CachedNetworkImage(
                  imageUrl: screenshot.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const GlobalLoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
