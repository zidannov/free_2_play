import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(
                  screenshot.image,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
