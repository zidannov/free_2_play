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
    bool isGlow,
  ) {
    return SizedBox(
      width: 48,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xFF2C3036),
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(
                  icon,
                  color: const Color(0xFF898989),
                ),
                onPressed: onPressed,
              ),
              isGlow
                  ? Positioned(
                      top: 5, // Atur posisi vertikal
                      right: 5, // Atur posisi horizontal
                      child: Container(
                        width: 7, // Diameter titik kuning
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.yellow, // Warna titik
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.yellow.withOpacity(0.5), // Warna glow
                              spreadRadius: 2,
                              blurRadius: 10, // Radius glow
                              offset: const Offset(0, 0), // Posisi glow
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
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

  BoxDecoration messageDecoration(ChatMessage message,
      ChatMessage? previousMessage, ChatMessage? nextMessage) {
    return BoxDecoration(
      color: message.user.id == currentUser.id
          ? Colors.blue
          : AppColors.primaryTextColor3,
      borderRadius: BorderRadius.circular(4),
    );
  }

  Widget messageText(ChatMessage message, ChatMessage? previousMessage,
      ChatMessage? nextMessage) {
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

  Widget buildTypingIndicator(ChatUser user) {
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

  @override
  Widget build(BuildContext context) {
    return DashChat(
      quickReplyOptions: const QuickReplyOptions(),
      messageOptions: MessageOptions(
        containerColor: AppColors.backgroundColor4,
        textColor: AppColors.primaryTextColor,
        messageDecorationBuilder: messageDecoration,
        messageTextBuilder: messageText,
      ),
      messageListOptions: MessageListOptions(
        typingBuilder: buildTypingIndicator,
      ),
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hoverColor: AppColors.primaryTextColor3,
          focusColor: Colors.white,
          enabled: true,
          filled: true,
          iconColor: AppColors.primaryTextColor3,
          fillColor: AppColors.backgroundColor6,
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
            _buildIconButton(context, onSend, Icons.send, false),
        trailing: [
          _buildIconButton(context, onSendMedia, Icons.image, true),
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
