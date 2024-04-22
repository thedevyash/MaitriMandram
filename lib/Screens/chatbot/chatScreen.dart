import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehyogini_frontned/Screens/chatbot/secrets.dart';

class chatScreen extends StatefulWidget {
  String username;
  chatScreen({super.key, required this.username});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _openAI = OpenAI.instance.build(
      token: api_key,
      enableLog: true,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
  // final assistants = await _openAI.assistant.retrieves(assistantId: '');
  ChatUser _currentuser = ChatUser(id: "1", firstName: "Me");
  ChatUser _gpttuser = ChatUser(
      id: "2",
      firstName: "Meri",
      lastName: "Saheli",
      profileImage: "assets/bot.png");
  List<ChatMessage> _messages = [];
  List<ChatUser> typing = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          titleTextStyle:
              GoogleFonts.comfortaa(color: Colors.white, fontSize: 30),
          title: Text(
            "Meri Saheli",
          ),
          elevation: 8, // Increased elevation for more prominent shadow
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5A1DEC), // Purple
                  Color(0xFFFF3366), // Pink
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.3), // Shadow color with transparency
                  blurRadius: 8, // Spread of the shadow
                  offset: Offset(0, 4), // Offset of the shadow
                ),
              ],
            ),
          ),
        ),
        body: DashChat(
            typingUsers: typing,
            messageOptions: MessageOptions(
                currentUserContainerColor: Colors.deepPurple,
                containerColor: Colors.purple,
                textColor: Colors.white),
            scrollToBottomOptions: ScrollToBottomOptions(),
            currentUser: _currentuser,
            onSend: (ChatMessage m) {
              m.text = "${m.text}";
              getChatResponse(m);
            },
            messages: _messages),
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      typing.add(_gpttuser);
    });

    //context ke liye list bhejo
    List<Messages> _messagesHistory = _messages.reversed.map((m) {
      if (m.user == _currentuser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.system, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: _messagesHistory,
        maxToken: 200);
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  user: _gpttuser,
                  createdAt: DateTime.now(),
                  text: "${element.message!.content}"));
          typing.remove(_gpttuser);
        });
      }
    }
  }
}
