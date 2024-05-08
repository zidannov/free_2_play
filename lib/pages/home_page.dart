import 'package:flutter/material.dart';
import 'package:free_2_play/pages/widgets/game_newest_widget.dart';
import '../utils/app_colors.dart';
import 'widgets/game_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
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
        // centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          GameNewestWidget(),
          Expanded(
            child: GameListWidget(),
          ),
        ],
      ),
    );
  }
}
