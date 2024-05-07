import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/games_model.dart';
import 'game_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<GameListModel>> games;

  @override
  void initState() {
    super.initState();
    games = ApiService().fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FREE-2-PLAY'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<GameListModel>>(
        future: games,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var game = snapshot.data![index];
                return ListTile(
                  leading: Image.network(game.thumbnail),
                  title: Text(game.title),
                  subtitle: Text(game.genre),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameDetailPage(
                          game: game,
                          category: game.genre,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
