import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../constant/color_constant.dart';

class TypingIndicatorWidget extends StatelessWidget {
  final ChatUser user;
  final List<ChatUser> typingUsers;

  const TypingIndicatorWidget({
    super.key,
    required this.user,
    required this.typingUsers,
  });

  @override
  Widget build(BuildContext context) {
    if (typingUsers.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 8),
              const TypingIndicator(
                flashingCircleBrightColor: ColorConstant.primaryTextColor2,
                flashingCircleDarkColor: ColorConstant.accentColor,
              ),
              const SizedBox(width: 3),
              Text(
                '${user.firstName} is typing',
                style: const TextStyle(
                  color: ColorConstant.primaryTextColor2,
                ),
              )
            ],
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
