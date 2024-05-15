import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../constant/color_constant.dart';
import 'gemini/gemini_page.dart';
import 'search/search_page.dart';
import 'widgets/global_app_bar_widget.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late PersistentTabController _controller;
  bool changeShadow = false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _controller.addListener(() {
      if (_controller.index == 2) {
        // index 2 adalah ChatbotPage
        setState(() {
          changeShadow = true;
        });
      } else {
        setState(() {
          changeShadow = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.black,
      appBar: GlobalAppBar(
        changeShadow: changeShadow,
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
            screen: const GeminiPage(),
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
            color: ColorConstant.primaryColor,
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
