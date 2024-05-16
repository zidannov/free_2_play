import 'package:flutter/material.dart';
import '../../../constant/color_constant.dart';
import '../../widgets/global_text_widget.dart';

class GameDetailFloatingText extends StatelessWidget {
  final dynamic game;
  final String text;

  const GameDetailFloatingText({
    super.key,
    required this.game,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalTextWidget(
            text: text,
            fontSize: 16,
            color: ColorConstant.accentTextColor,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorConstant.backgroundColor3,
            ),
            child: GlobalTextWidget(
              text: game,
              color: ColorConstant.primaryTextColor2,
            ),
          ),
        ],
      ),
    );
  }
}
