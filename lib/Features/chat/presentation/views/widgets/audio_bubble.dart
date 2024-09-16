import 'package:chat_task/core/common/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../controller/chat/chat_bloc.dart';
import '../../controller/message.dart';

class AudioBubble extends StatelessWidget {
  const AudioBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: VoiceMessageView(
            //backgroundColor: Colors.transparent,
            activeSliderColor: Colors.blue,
            //notActiveSliderColor: AllColors.sendBubble.withOpacity(0.04),
            circlesColor: AllColors.lightBlue,
            innerPadding: 0,
            controller: VoiceController(
              audioSrc: message.content,
              maxDuration: message.totalDuration,
              isFile: true,
              onComplete: () {
                // context
                //     .read<ChatBloc>()
                //     .add(ChatEvent.stopVoiceMessage(message.id, audioPlayer));
              },
              onPause: () {
                // context
                //     .read<ChatBloc>()
                //     .add(ChatEvent.pauseVoiceMessage(message.id, audioPlayer));
              },
              onPlaying: () {
                // context
                //     .read<ChatBloc>()
                //     .add(ChatEvent.playVoiceMessage(message.id, audioPlayer));
              },
            ),
          ),
        );
        // return Row(
        //   mainAxisAlignment: message.isSender
        //       ? MainAxisAlignment.end
        //       : MainAxisAlignment.start,
        //   children: [
        //     //PlayButton(player: audioPlayer, messageId: message.id),
        //     GestureDetector(
        //       child: Icon(
        //         message.isPlaying ? Icons.pause : Icons.play_arrow,
        //         color: AllColors.lightBlue,
        //       ),
        //       onTap: () {
        //         if (message.isPlaying) {
        //           //audioPlayer.stop();
        //           context.read<ChatBloc>().add(
        //               ChatEvent.pauseVoiceMessage(message.id, audioPlayer));
        //         } else {
        //           audioPlayer.setFilePath(message.content);
        //           context
        //               .read<ChatBloc>()
        //               .add(ChatEvent.playVoiceMessage(message.id, audioPlayer));
        //         }
        //       },
        //     ),
        //     const SizedBox(width: 8),
        //     Expanded(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           // LinearProgressIndicator(
        //           //   value: position.inMilliseconds.toDouble(),
        //           // ),
        //           Slider(
        //             min: 0,
        //             value: position, //position.inMilliseconds.toDouble(),
        //             max: duration, //duration.inMilliseconds.toDouble(),

        //             // value: (duration.inMilliseconds > 0)
        //             //     ? position.inMilliseconds
        //             //         .clamp(0, duration.inMilliseconds)
        //             //         .toDouble()
        //             //     : 0.0, //position.inMilliseconds.toDouble(),
        //             // max: (duration.inMilliseconds > 0)
        //             //     ? duration.inMilliseconds.toDouble()
        //             //     : 1.0, //duration.inMilliseconds.toDouble(),
        //             onChanged: (value) {
        //               context.read<ChatBloc>().add(
        //                     ChatEvent.seekVoiceMessage(
        //                       message.id,
        //                       Duration(seconds: value.toInt()),
        //                       audioPlayer,
        //                     ),
        //                   );
        //             },
        //           ),
        //           Text(
        //             '${formatDuration(message.totalDuration)} / ${formatDuration(message.currentPosition)}',
        //             style: Styles.hintStyle().copyWith(fontSize: 10),
        //           ),
        //           // Row(
        //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           //   children: [
        //           //     Text(
        //           //       prettyDuration(position),
        //           //       style: const TextStyle(
        //           //           fontSize: 10, color: Colors.grey),
        //           //     ),
        //           //     const Text(
        //           //       "M4A",
        //           //       style:
        //           //           TextStyle(fontSize: 10, color: Colors.grey),
        //           //     ),
        //           //   ],
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }

  String prettyDuration(Duration d) {
    var min = d.inMinutes < 10 ? "0${d.inMinutes}" : d.inMinutes.toString();
    var sec = d.inSeconds % 60 < 10
        ? "0${d.inSeconds % 60}"
        : (d.inSeconds % 60).toString();
    return "$min:$sec";
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
