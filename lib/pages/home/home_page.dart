import 'package:flutter/material.dart';
import 'package:free_2_play/pages/home/widgets/game_newest_widget.dart';
import '../../utils/app_colors.dart';
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
    return Container(
      color: AppColors.backgroundColor4,
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 8),
              child: Text(
                'NEW RELEASES',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Motiva Sans',
                  color: AppColors.primaryTextColor,
                  // fontFamily:
                ),
              ),
            ),
          ),
          GameNewestWidget(),
          GameListWidget(),
        ],
      ),
    );
  }
}
