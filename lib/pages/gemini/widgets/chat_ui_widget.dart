import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:free_2_play/pages/gemini/widgets/message_text_widget.dart';
import 'package:free_2_play/constant/color_constant.dart';

import 'icon_button_widget.dart';
import 'typing_indicator_widget.dart';

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
        containerColor: ColorConstant.backgroundColor4,
        textColor: ColorConstant.primaryTextColor,
        messageDecorationBuilder: (message, previousMessage, nextMessage) =>
            BoxDecoration(
          color: message.user.id == currentUser.id
              ? Colors.blue
              : ColorConstant.primaryTextColor3,
          borderRadius: BorderRadius.circular(4),
        ),
        messageTextBuilder: (message, previousMessage, nextMessage) =>
            MessageTextWidget(
          message: message,
          previousMessage: previousMessage,
          nextMessage: nextMessage,
          currentUser: currentUser,
        ),
        textBeforeMedia: false,
      ),
      messageListOptions: MessageListOptions(
        typingBuilder: (user) => TypingIndicatorWidget(
          user: user,
          typingUsers: typingUsers,
        ),
      ),
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hoverColor: ColorConstant.primaryTextColor3,
          focusColor: Colors.white,
          enabled: true,
          filled: true,
          iconColor: ColorConstant.primaryTextColor3,
          fillColor: ColorConstant.backgroundColor6,
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
          color: ColorConstant.primaryTextColor3,
        ),
        alwaysShowSend: true,
        cursorStyle: const CursorStyle(
          color: Colors.blue,
        ),
        sendButtonBuilder: (Function() onSend) => IconButtonWidget(
          context: context,
          onPressed: onSend,
          icon: Icons.send,
          isGlow: false,
        ),
        trailing: [
          IconButtonWidget(
            context: context,
            onPressed: onSendMedia,
            icon: Icons.image,
            isGlow: true,
          ),
        ],
        onTextChange: onTextChanged,
        inputToolbarStyle: BoxDecoration(
          color: ColorConstant.accentColor,
          boxShadow: [
            BoxShadow(
              color: ColorConstant.primaryTextColor2.withOpacity(0.4),
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

InputBorder outlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.5,
      color: Color(0xFF111114),
    ),
    borderRadius: BorderRadius.zero,
  );
}
