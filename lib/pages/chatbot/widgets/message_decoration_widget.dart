import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

BoxDecoration messageDecoration(
    ChatMessage message,
    ChatMessage? previousMessage,
    ChatMessage? nextMessage,
    ChatUser currentUser) {
  return BoxDecoration(
    color: message.user.id == currentUser.id
        ? Colors.blue
        : AppColors.primaryTextColor3,
    borderRadius: BorderRadius.circular(4),
  );
}
