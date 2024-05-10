import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:free_2_play/utils/app_colors.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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

  Widget _buildIconButton(
    BuildContext context,
    VoidCallback onPressed,
    IconData icon,
  ) {
    return SizedBox(
      width: 48,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            border: Border(
              top: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
          ),
          child: IconButton(
            icon: Icon(
              icon,
              color: AppColors.accentTextColor,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  InputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.zero,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messageOptions: MessageOptions(
        containerColor: AppColors.backgroundColor4,
        textColor: AppColors.primaryTextColor,
        messageDecorationBuilder: (
          ChatMessage message,
          ChatMessage? previousMessage,
          ChatMessage? nextMessage,
        ) {
          return BoxDecoration(
            color: message.user.id == currentUser.id
                ? Colors.blue
                : AppColors.primaryTextColor3,
            borderRadius: BorderRadius.circular(4),
          );
        },
        messageTextBuilder: (ChatMessage message, ChatMessage? previousMessage,
            ChatMessage? nextMessage) {
          return MarkdownBody(
            data: message.text,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: TextStyle(
                color: message.user.id == currentUser.id
                    ? AppColors.primaryColor
                    : AppColors.primaryColor,
                fontFamily: 'Arial',
              ),
            ),
          );
        },
      ),
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hoverColor: AppColors.primaryTextColor3,
          focusColor: Colors.white,
          enabled: true,
          filled: true,
          iconColor: AppColors.primaryTextColor3,
          fillColor: AppColors.primaryColor,
          border: customOutlineInputBorder(),
          enabledBorder: customOutlineInputBorder(),
          disabledBorder: customOutlineInputBorder(),
          focusedBorder: customOutlineInputBorder(),
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
        sendButtonBuilder: (Function() onSend) =>
            _buildIconButton(context, onSend, Icons.send),
        trailing: [
          _buildIconButton(context, onSendMedia, Icons.image),
        ],
        onTextChange: onTextChanged,
      ),
      currentUser: currentUser,
      onSend: onSend,
      messages: messages,
      typingUsers: typingUsers,
    );
  }
}
