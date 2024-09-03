import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/chat_header.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/input_field.dart';
import 'package:chat_task/core/common/res/colors.dart';
import 'package:chat_task/core/common/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/chat/chat_bloc.dart';
import 'controller/message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 0.5,
                color: AllColors.border,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
              child: Column(
                children: [
                  const ChatHeader(),
                  Divider(
                    height: 40.h,
                    color: AllColors.border,
                  ),
                  Expanded(
                    child: BlocBuilder<ChatBloc, ChatState>(
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            return _buildChatBubble(message);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const InputField()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage message) {
    switch (message.type) {
      case MessageType.text:
        return BubbleNormal(
          text: message.content,
          isSender: message.isSender,
          color:
              message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
          tail: true,
          textStyle: Styles.messageStyle(),
        );
      case MessageType.image:
        return BubbleNormalImage(
          id: message.id.toString(),
          image: Image.network(message.content),
          isSender: message.isSender,
        );
      case MessageType.document:
        return BubbleSpecialThree(
          text: "📄 ${message.content}",
          isSender: message.isSender,
          color:
              message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
          tail: true,
          textStyle: Styles.messageStyle(),
        );
      case MessageType.voice:
        return BubbleSpecialTwo(
          text: "Voice Message",
          isSender: message.isSender,
          color:
              message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
          tail: true,
          textStyle: Styles.messageStyle(),
        );
      default:
        return const SizedBox();
    }
  }
}
