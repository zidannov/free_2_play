import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/custom_text_widget.dart';

import '../search_result_page.dart';

class SearchListWidget extends StatelessWidget {
  final categories = [
    "Shooter",
    "MMORPG",
    "MOBA",
    "Sports",
    "Social",
    "Strategy",
    "Battle Royale",
    "Card",
    "Card Game",
    "Fantasy",
    "Fighting",
    "MMO",
    "MMOARPG",
    "MMORPG",
    "Racing",
    "Action",
    "Action Game",
    "Action RPG",
    "ARPG",
  ];

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
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 48),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SearchResultPage(category: categories[index]),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                // image: AssetImage('assets/images/${categories[index]}.png'),
                image: AssetImage('assets/images/action.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        colors[index % colors.length].withOpacity(1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      categories[index].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
