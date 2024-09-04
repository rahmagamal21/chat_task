import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
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
                                  context: context,
                                  playerController: PlayerController(),
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

  Future<int> getFileSize(String filePath) async {
    final file = File(filePath);
    final fileSize = await file.length();
    return fileSize;
  }

  String formatFileSize(int bytes) {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    } else if (bytes >= 1024) {
      return '${(bytes / 1024).toStringAsFixed(2)} KB';
    } else {
      return '$bytes bytes';
    }
  }

  Widget _buildChatBubble(
      {required ChatMessage message,
      required BuildContext context,
      required PlayerController playerController
      //required bool isPlaying,
      // required Function(bool) onPlayPause,
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
        return Container(
          constraints: BoxConstraints(maxWidth: 263.w, minWidth: 122.w),
          padding: EdgeInsets.all(5.w),
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
          child: Image.file(
            File(message.content),
            fit: BoxFit.cover,
          ),
        );
      // return BubbleNormalImage(
      //   id: message.id.toString(),
      //   image: Image.file(
      //     File(message.content),
      //   ), //Image.network(message.content),
      //   isSender: message.isSender,
      // );
      case MessageType.document:
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/file.png',
                width: 30.w,
                height: 30.h,
              ),
              //SvgPicture.asset('assets/images/attach-square.svg'),
              SizedBox(
                width: 8.w,
              ),

              // Image.file(
              //   File(message.content),
              //   fit: BoxFit.cover,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.content.split('/').last,
                    style: Styles.messageStyle(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  FutureBuilder<int>(
                    future: getFileSize(message.content),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading...',
                          style: Styles.hintStyle().copyWith(fontSize: 10),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error',
                          style: Styles.hintStyle().copyWith(fontSize: 10),
                        );
                      } else if (snapshot.hasData) {
                        final formattedSize = formatFileSize(snapshot.data!);
                        return Text(
                          formattedSize,
                          style: Styles.hintStyle().copyWith(fontSize: 10),
                        ); // Display the file size
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      // return BubbleSpecialThree(
      //   text: "📄 ${message.content}",
      //   isSender: message.isSender,
      //   color:
      //       message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
      //   tail: true,
      //   textStyle: Styles.messageStyle(),
      // );
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
                size: Size(200.w, 40.h),
                playerWaveStyle: const PlayerWaveStyle(
                    liveWaveColor: Colors.blue,
                    fixedWaveColor: Colors.grey,
                    spacing: 8.0,
                    showSeekLine: false),
                enableSeekGesture: true,
                waveformType: WaveformType.long,
              ),
              GestureDetector(
                child: Icon(
                  message.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.blue,
                ),
                onTap: () {
                  final chatBloc = context.read<ChatBloc>();
                  if (message.isPlaying) {
                    chatBloc.add(ChatEvent.pauseVoiceMessage(message.id));
                  } else {
                    chatBloc.add(ChatEvent.playVoiceMessage(
                        message.content, message.id));
                  }
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
