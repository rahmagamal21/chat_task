import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/chat_header.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/input_field.dart';
import 'package:chat_task/core/common/res/colors.dart';
import 'package:chat_task/core/common/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/chat/chat_bloc.dart';

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
                        return ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            return state.messages.isNotEmpty
                                ? Row(
                                    children: [
                                      ChatBubble(
                                        message: message,
                                        playerController: PlayerController(),
                                      ),
                                      // _buildChatBubble(
                                      //   message: message,
                                      //   context: context,
                                      //   playerController: PlayerController(),
                                      // ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        message.timing,
                                        style: Styles.time(),
                                      ),
                                    ],
                                  )
                                : const SizedBox();
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20.h,
                            );
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
}
