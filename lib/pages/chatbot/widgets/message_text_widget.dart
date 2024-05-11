import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../utils/app_colors.dart';

Widget messageText(ChatMessage message, ChatMessage? previousMessage,
    ChatMessage? nextMessage, ChatUser currentUser) {
  return MarkdownBody(
    data: message.text,
    styleSheet: MarkdownStyleSheet(
      p: TextStyle(
        color: message.user.id == currentUser.id
            ? AppColors.primaryColor
            : AppColors.primaryColor,
        fontFamily: 'Arial',
      ),
    ),
  );
}
