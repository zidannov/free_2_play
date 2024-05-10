import 'package:flutter/material.dart';
import 'package:free_2_play/pages/home/home_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../utils/app_colors.dart';
import 'chatbot/chatbot_page.dart';
import 'search/search_page.dart';
import 'widgets/custom_app_bar.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor4,
      appBar: const CustomAppBar(),
      body: PersistentTabView(
        navBarHeight: 52,
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              inactiveIcon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: const SearchPage(),
            item: ItemConfig(
              icon: const Icon(Icons.search),
              inactiveIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          PersistentTabConfig(
            screen: const ChatbotPage(),
            item: ItemConfig(
              icon: const Icon(Icons.chat),
              inactiveIcon: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
          navBarDecoration: const NavBarDecoration(
            color: AppColors.primaryColor,
          ),
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
