import 'package:flutter/material.dart';
import 'package:free_2_play/pages/search/widgets/search_list_widget.dart';
import 'package:free_2_play/constant/color_constant.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor4,
      body: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: SearchListWidget(),
      ),
    );
  }
}
