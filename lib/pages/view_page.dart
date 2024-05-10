import 'package:flutter/material.dart';
import 'home/home_page.dart';
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
  late PersistentTabController _controller;
  bool showShadow = true;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      if (_controller.index == 2) {
        // index 2 adalah ChatbotPage
        setState(() {
          showShadow = false;
        });
      } else {
        setState(() {
          showShadow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        showShadow: showShadow,
      ),
      body: PersistentTabView(
        controller: _controller,
        navBarHeight: 52,
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(
                Icons.home,
              ),
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
        navBarBuilder: (navBarConfig) => Style10BottomNavBar(
          navBarDecoration: NavBarDecoration(
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                blurRadius: 8,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
