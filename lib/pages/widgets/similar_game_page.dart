import 'package:flutter/material.dart';
import '../../models/games_model.dart';
import '../../services/api_service.dart';

class HorizontalGameList extends StatelessWidget {
  final Future<List<GameListModel>> games;

  const HorizontalGameList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameListModel>>(
      future: games,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return SizedBox(
              height: 200, // Sesuaikan dengan kebutuhan
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var game = snapshot.data![index];
                  return Container(
                    width: 140, // Sesuaikan lebar setiap item
                    margin: const EdgeInsets.only(
                        right: 16), // Margin di sekitar setiap item
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                8), // Sudut membulat pada gambar
                            child: Image.network(
                              game.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 8), // Jarak antara gambar dan teks
                        Text(
                          game.title,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Text('No data available');
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
