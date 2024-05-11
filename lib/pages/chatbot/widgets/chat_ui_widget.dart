import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:free_2_play/pages/chatbot/widgets/message_text_widget.dart';
import 'package:free_2_play/utils/app_colors.dart';

import 'build_icon_button_widget.dart';
import 'build_typing_indicator_widget.dart';
import 'outline_input_border_widget.dart';
import 'message_decoration_widget.dart';

class ChatUI extends StatelessWidget {
  final ChatUser currentUser;
  final List<ChatMessage> messages;
  final Function(ChatMessage) onSend;
  final Function() onSendMedia;
  final Function(String) onTextChanged;
  final List<ChatUser> typingUsers;

  const ChatUI({
    super.key,
    required this.currentUser,
    required this.messages,
    required this.onSend,
    required this.onSendMedia,
    required this.onTextChanged,
    required this.typingUsers,
  });

  @override
  Widget build(BuildContext context) {
    return DashChat(
      quickReplyOptions: const QuickReplyOptions(),
      messageOptions: MessageOptions(
        containerColor: AppColors.backgroundColor4,
        textColor: AppColors.primaryTextColor,
        messageDecorationBuilder: (message, previousMessage, nextMessage) =>
            messageDecoration(
          message,
          previousMessage,
          nextMessage,
          currentUser,
        ),
        messageTextBuilder: (message, previousMessage, nextMessage) =>
            messageText(
          message,
          previousMessage,
          nextMessage,
          currentUser,
        ),
      ),
      messageListOptions: MessageListOptions(
        typingBuilder: (user) => buildTypingIndicator(
          user: user,
          typingUsers: typingUsers,
        ),
      ),
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hoverColor: AppColors.primaryTextColor3,
          focusColor: Colors.white,
          enabled: true,
          filled: true,
          iconColor: AppColors.primaryTextColor3,
          fillColor: AppColors.backgroundColor6,
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          disabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        inputTextStyle: const TextStyle(
          fontFamily: 'Mortiva Sans',
          fontSize: 14,
          color: AppColors.primaryTextColor3,
        ),
        alwaysShowSend: true,
        cursorStyle: const CursorStyle(
          color: Colors.blue,
        ),
        sendButtonBuilder: (Function() onSend) => buildIconButton(
          context,
          onSend,
          Icons.send,
          false,
        ),
        trailing: [
          buildIconButton(
            context,
            onSendMedia,
            Icons.image,
            true,
          ),
        ],
        onTextChange: onTextChanged,
        inputToolbarStyle: BoxDecoration(
          color: AppColors.accentColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryTextColor2.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        inputToolbarMargin: const EdgeInsets.only(top: 16),
      ),
      currentUser: currentUser,
      onSend: onSend,
      messages: messages,
      typingUsers: typingUsers,
    );
  }
}
