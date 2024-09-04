import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
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
                        return ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state.messages[index];
                            return Row(
                              children: [
                                _buildChatBubble(
                                  message: message,
                                  isPlaying:
                                      state.playingMessageId == message.id &&
                                          state.isPlaying!,
                                  onPlayPause: (isPlaying) {
                                    final chatBloc = context.read<ChatBloc>();
                                    if (isPlaying) {
                                      chatBloc.add(ChatEvent.pauseVoiceMessage(
                                          message.id));
                                    } else {
                                      chatBloc.add(ChatEvent.playVoiceMessage(
                                          message.content, message.id));
                                    }
                                  },
                                  playerController:
                                      context.read<ChatBloc>().playerController,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  message.timing,
                                  style: Styles.time(),
                                ),
                              ],
                            );
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

  Widget _buildChatBubble({
    required ChatMessage message,
    required bool isPlaying,
    required Function(bool) onPlayPause,
    required PlayerController playerController,
  }) {
    switch (message.type) {
      case MessageType.text:
        return Container(
          constraints: BoxConstraints(maxWidth: 263.w, minWidth: 122.w),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(10),
              topLeft:
                  message.isSender ? const Radius.circular(10) : Radius.zero,
              topRight:
                  message.isSender ? Radius.zero : const Radius.circular(10),
            ),
            color: message.isSender
                ? AllColors.sendBubble
                : AllColors.receiveBubble,
          ),
          child: Text(
            message.content,
            style: Styles.messageStyle(),
          ),
        );
      // return BubbleNormal(
      //   text: message.content,
      //   isSender: message.isSender,
      //   color:
      //       message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
      //   tail: true,
      //   textStyle: Styles.messageStyle(),
      // );
      case MessageType.image:
        return BubbleNormalImage(
          id: message.id.toString(),
          image: Image.file(
            File(message.content),
          ), //Image.network(message.content),
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
        return Container(
          constraints: BoxConstraints(maxWidth: 260.w, minWidth: 122.w),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(10),
              bottomLeft: const Radius.circular(10),
              topLeft:
                  message.isSender ? const Radius.circular(10) : Radius.zero,
              topRight:
                  message.isSender ? Radius.zero : const Radius.circular(10),
            ),
            color: message.isSender
                ? AllColors.sendBubble
                : AllColors.receiveBubble,
          ),
          child: Row(
            mainAxisAlignment: message.isSender
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              AudioFileWaveforms(
                playerController: playerController,
                size: const Size(200, 50),
                playerWaveStyle: const PlayerWaveStyle(
                  liveWaveColor: Colors.blue,
                  fixedWaveColor: Colors.grey,
                  spacing: 8.0,
                ),
                enableSeekGesture: true,
                waveformType: WaveformType.long,
              ),
              GestureDetector(
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.blue,
                ),
                onTap: () {
                  onPlayPause(isPlaying);
                },
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
