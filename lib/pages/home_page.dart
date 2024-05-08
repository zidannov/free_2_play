import 'package:flutter/material.dart';
import 'package:free_2_play/services/game_service.dart';
import 'package:free_2_play/utils/app_colors.dart';
import '../models/game_list_model.dart';
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
    games = GameService().fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'FREE-2-PLAY',
          style: TextStyle(color: AppColors.primaryTextColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
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
                  title: Text(
                    game.title,
                    style: TextStyle(color: AppColors.primaryTextColor),
                  ),
                  subtitle: Text(
                    game.genre,
                    style: TextStyle(color: AppColors.primaryTextColor2),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameDetailPage(
                          gameId: game.id,
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
