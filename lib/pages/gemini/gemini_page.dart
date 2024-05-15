import 'dart:io';
import 'dart:typed_data';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:free_2_play/constant/asset_constant.dart';
import 'package:free_2_play/pages/gemini/widgets/chat_ui_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class GeminiPage extends StatefulWidget {
  const GeminiPage({super.key});

  @override
  State<GeminiPage> createState() => _GeminiPageState();
}

class _GeminiPageState extends State<GeminiPage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  List<ChatUser> typingUsers = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage: ImageConstant.geminiLogo,
  );
  String fullResponse = "";

  @override
  void initState() {
    super.initState();
    _sendWelcomeMessage();
  }

  void _sendWelcomeMessage() {
    ChatMessage welcomeMessage = ChatMessage(
      user: geminiUser,
      text:
          "Selamat datang! Saya adalah asisten virtual Anda. Silakan ajukan pertanyaan mengenai game.",
      createdAt: DateTime.now(),
    );
    setState(
      () {
        messages.add(welcomeMessage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202227),
      body: Stack(
        children: [
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
      typingUsers.add(geminiUser);
      fullResponse = "";
    });

    bool isKeywordPresent(String response, String keyword) {
      // regex untuk mencari kata kunci sebagai kata terpisah
      RegExp exp =
          RegExp(r'\b' + RegExp.escape(keyword) + r'\b', caseSensitive: false);
      return exp.hasMatch(response);
    }

    Completer<void> completer = Completer<void>();

    try {
      String questionPrefix = "pertanyaannya: ";
      String question = questionPrefix + chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        fullResponse += event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";
      }, onDone: () {
        if (isKeywordPresent(fullResponse, "game")) {
          ChatMessage message = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text: fullResponse,
          );
          setState(() {
            messages = [message, ...messages];
          });
        } else {
          ChatMessage apologyMessage = ChatMessage(
            user: geminiUser,
            createdAt: DateTime.now(),
            text:
                "Maaf, saya tidak memiliki informasi mengenai topik di luar 'game'.",
          );
          setState(() {
            messages = [apologyMessage, ...messages];
          });
        }
        typingUsers.remove(geminiUser);
      }, onError: (error) {
        completer.completeError(error);
      });
    } catch (e) {
      //
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
        text: "Jelaskan gambar dibawah",
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
