import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/res/colors.dart';
import '../../../../../core/common/res/styles.dart';
import '../../controller/chat/chat_bloc.dart';
import '../../controller/message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.playerController,
  });

  final ChatMessage message;
  final PlayerController playerController;

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
    return Container(
      constraints: BoxConstraints(maxWidth: 260.w, minWidth: 122.w),
      padding: EdgeInsets.all(message.type == MessageType.image ? 5.w : 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: const Radius.circular(10),
          bottomLeft: const Radius.circular(10),
          topLeft: message.isSender ? const Radius.circular(10) : Radius.zero,
          topRight: message.isSender ? Radius.zero : const Radius.circular(10),
        ),
        color:
            message.isSender ? AllColors.sendBubble : AllColors.receiveBubble,
      ),
      child: buildBubbleChild(context),
    );
  }

  Widget buildBubbleChild(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: Styles.messageStyle(),
        );
      case MessageType.image:
        return Image.file(
          File(message.content),
          fit: BoxFit.cover,
        );
      case MessageType.document:
        return Row(
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
        );
      case MessageType.voice:
        return Row(
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
                  chatBloc.add(
                      ChatEvent.playVoiceMessage(message.content, message.id));
                }
              },
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }
}
