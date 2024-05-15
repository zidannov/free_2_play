import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../constant/color_constant.dart';

class MessageTextWidget extends StatelessWidget {
  final ChatMessage message;
  final ChatMessage? previousMessage;
  final ChatMessage? nextMessage;
  final ChatUser currentUser;

  const MessageTextWidget({
    super.key,
    required this.message,
    this.previousMessage,
    this.nextMessage,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: message.text,
      styleSheet: MarkdownStyleSheet(
        p: TextStyle(
          color: message.user.id == currentUser.id
              ? ColorConstant.primaryColor
              : ColorConstant.primaryColor,
          fontFamily: 'Arial',
        ),
      ),
    );
  }
}
