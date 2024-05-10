import 'package:flutter/material.dart';
import '../../../models/game_list_model.dart'; // Asumsi Anda memiliki model Game
import '../../../services/game_service.dart'; // Asumsi Anda memiliki GameService untuk mengambil data

class SearchResultPage extends StatelessWidget {
  final String category;

  const SearchResultPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games in $category'),
      ),
      body: FutureBuilder<List<GameListModel>>(
        future: GameService().fetchGameByCategory(category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final games = snapshot.data!;
            return ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                final game = games[index];
                return ListTile(
                  title: Text(game.title),
                  onTap: () {
                    // Navigasi ke detail game jika diperlukan
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No games found'));
          }
        },
      ),
    );
  }
}
