import 'dart:io';

import 'package:chat_task/Features/chat/presentation/views/widgets/audio_bubble.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';

import '../../../../../core/common/res/colors.dart';
import '../../../../../core/common/res/styles.dart';
import '../../controller/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final ChatMessage message;

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

  @override
  Widget build(BuildContext context) {
    if (message.type == MessageType.voice) {
      return Container(
        constraints: BoxConstraints(maxWidth: 260.w, minWidth: 122.w),
        padding: EdgeInsets.all(message.type == MessageType.image ? 5.w : 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(10),
            bottomLeft: const Radius.circular(10),
            topLeft: message.isSender ? const Radius.circular(10) : Radius.zero,
            topRight:
                message.isSender ? Radius.zero : const Radius.circular(10),
          ),
          border: Border.all(width: 0.5, color: AllColors.border),
          color: message.isSender ? Colors.white : AllColors.receiveBubble,
        ),
        child: AudioBubble(message: message),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxWidth: 260.w,
          minWidth: 122.w,
        ),
        padding: EdgeInsets.all(message.type == MessageType.image ? 5.w : 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(10),
            bottomLeft: const Radius.circular(10),
            topLeft: message.isSender ? const Radius.circular(10) : Radius.zero,
            topRight:
                message.isSender ? Radius.zero : const Radius.circular(10),
          ),
          color:
              message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
        ),
        child: buildBubbleChild(context),
      );
    }
  }

  Widget buildBubbleChild(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: Styles.messageStyle(),
        );
      case MessageType.image:
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ImageViewerScreen(imagePath: message.content),
              ),
            );
          },
          child: Image.file(
            File(message.content),
            fit: BoxFit.cover,
          ),
        );
      case MessageType.document:
        return GestureDetector(
          onTap: () async {
            await OpenFilex.open(message.content);
          },
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
                        );
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
      // case MessageType.voice:
      //   return AudioBubble(message: message);
      // IconData? icon;
      // bool isPlaying = false;
      // double? currentPosition;
      // void Function(double)? onChanged;
      // return BlocConsumer<ChatBloc, ChatState>(
      //   builder: (context, state) {
      //     // final updatedMessage =
      //     //     state.messages.firstWhere((m) => m.id == message.id);
      //     return Row(
      //       mainAxisAlignment: message.isSender
      //           ? MainAxisAlignment.end
      //           : MainAxisAlignment.start,
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Slider(
      //               value: currentPosition ??
      //                   0, //message.currentPosition.inSeconds.toDouble(),
      //               max: message.totalDuration.inSeconds.toDouble(),
      //               activeColor: Colors.blue,
      //               onChanged: onChanged,
      //               //inactiveColor: Colors.grey,
      //               // onChanged: (value) {
      //               //   context.read<ChatBloc>().add(
      //               //         ChatEvent.seekVoiceMessage(
      //               //           message.id,
      //               //           Duration(seconds: value.toInt()),
      //               //         ),
      //               //       );
      //               // },
      //             ),
      //             // Text(formatDuration(updatedMessage.currentPosition)),
      //             // const Text(" / "),
      //             Text(
      //               '${formatDuration(message.totalDuration)} / ${formatDuration(message.currentPosition)}',
      //               style: Styles.hintStyle().copyWith(fontSize: 10),
      //             ),
      //           ],
      //         ),
      //         GestureDetector(
      //           child: Icon(
      //             isPlaying ? Icons.pause : Icons.play_arrow,
      //             color: Colors.blue,
      //           ),
      //           onTap: () {
      //             context.read<ChatBloc>().add(
      //                   ChatEvent.playVoiceMessage(
      //                     message.id,
      //                     AudioPlayer(),
      //                   ),
      //                 );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      //   listener: (BuildContext context, ChatState state) {
      //     currentPosition = message.currentPosition.inSeconds.toDouble();
      //     isPlaying = message.isPlaying;
      //     onChanged = (value) {
      //       context.read<ChatBloc>().add(
      //             ChatEvent.seekVoiceMessage(
      //               message.id,
      //               Duration(seconds: value.toInt()),
      //             ),
      //           );
      //     };
      //   },
      // );
      default:
        return const SizedBox();
    }
  }
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}
