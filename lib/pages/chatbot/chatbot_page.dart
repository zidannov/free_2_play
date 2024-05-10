import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:free_2_play/pages/chatbot/widgets/chat_ui.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/app_colors.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  List<ChatUser> typingUsers = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage: "assets/logos/gemini_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 116,
              // color: AppColors.accentColor,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accentColor,
                    AppColors.backgroundColor2,
                  ],
                  stops: [
                    0.0,
                    1.0,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryTextColor2.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          ChatUI(
            currentUser: currentUser,
            messages: messages,
            onSend: _sendMessage,
            onSendMedia: _sendMediaMessage,
            typingUsers: typingUsers,
            onTextChanged: _handleUserTyping,
          ),
        ],
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
      typingUsers
          .add(geminiUser); // tambah AI ke typingUsers saat memulai proses
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
              typingUsers.remove(
                  geminiUser); // hapus AI dari typingUsers setelah selesai
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );
          setState(() {
            messages = [message, ...messages];
            typingUsers.remove(
                geminiUser); // hapus AI dari typingUsers setelah selesai
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _handleUserTyping(String text) {
    if (text.isNotEmpty && !typingUsers.contains(currentUser)) {
      setState(() {
        typingUsers.add(currentUser);
      });
    } else if (text.isEmpty && typingUsers.contains(currentUser)) {
      setState(() {
        typingUsers.remove(currentUser);
      });
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage(chatMessage);
    }
  }
}
