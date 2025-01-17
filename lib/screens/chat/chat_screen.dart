import 'package:flutter/material.dart';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/screens/chat/components/chat_text_field.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key, required this.chatWithID}) : super(key: key);

  final TextEditingController chatController = TextEditingController();
  final String chatWithID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat With [Ali]"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: ListView(
              shrinkWrap: false,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SelectableRegion(
                  focusNode: FocusNode(),
                  selectionControls: materialTextSelectionControls,
                  child: const BubbleSpecialThree(
                    text: 'Added iMessage shape bubbles',
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const BubbleSpecialThree(
                  text: "Thanks",
                  color: Color(0xFFE8E8EE),
                  tail: true,
                  isSender: false,
                ),
              ],
            ),
          ),
          const Spacer(),
          MessageBar(
            onSend: (p0) {
              print(p0);
              MurnyApi().chat(
                body: {
                  //TODO: DRIVER/USER ID
                  "sent_to": chatWithID,
                  "message": p0
                },
                function: Chat.sendMessages,
                token: '',
              );
            },
          ),
          // ChatTextField(content: "message", controller: chatController),
          // SizedBox(height: context.getHeight(factor: 0.015)),
        ],
      ),
    );
  }
}
