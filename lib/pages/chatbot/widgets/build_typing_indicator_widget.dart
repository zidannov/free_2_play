import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

Widget buildTypingIndicator(
    {required ChatUser user, required List<ChatUser> typingUsers}) {
  if (typingUsers.isNotEmpty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 8),
            const TypingIndicator(
              flashingCircleBrightColor: AppColors.primaryTextColor2,
              flashingCircleDarkColor: AppColors.accentColor,
            ),
            const SizedBox(width: 3),
            Text(
              '${user.firstName} is typing',
              style: const TextStyle(
                color: AppColors.primaryTextColor2,
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
