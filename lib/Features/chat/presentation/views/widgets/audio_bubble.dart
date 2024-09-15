import 'package:chat_task/core/common/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../../core/common/res/styles.dart';
import '../../controller/chat/chat_bloc.dart';
import '../../controller/message.dart';

class AudioBubble extends StatelessWidget {
  const AudioBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();

    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Icon(
                message.isPlaying ? Icons.pause : Icons.play_arrow,
                color: AllColors.lightBlue,
              ),
              onTap: () {
                if (message.isPlaying) {
                  context.read<ChatBloc>().add(
                      ChatEvent.pauseVoiceMessage(message.id, audioPlayer));
                } else {
                  audioPlayer.setFilePath(message.content);
                  context
                      .read<ChatBloc>()
                      .add(ChatEvent.playVoiceMessage(message.id, audioPlayer));
                }
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: StreamBuilder<Duration>(
                stream: audioPlayer.positionStream,
                builder: (context, snapshot) {
                  //final position = snapshot.data ?? Duration.zero;
                  //final duration = audioPlayer.duration ?? Duration.zero;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LinearProgressIndicator(
                      //   value: position.inMilliseconds.toDouble(),
                      // ),
                      Slider(
                        value: message.currentPosition.inMilliseconds
                            .toDouble(), //position.inMilliseconds.toDouble(),
                        max: message.totalDuration.inSeconds
                            .toDouble(), //duration.inMilliseconds.toDouble(),

                        // value: (duration.inMilliseconds > 0)
                        //     ? position.inMilliseconds
                        //         .clamp(0, duration.inMilliseconds)
                        //         .toDouble()
                        //     : 0.0, //position.inMilliseconds.toDouble(),
                        // max: (duration.inMilliseconds > 0)
                        //     ? duration.inMilliseconds.toDouble()
                        //     : 1.0, //duration.inMilliseconds.toDouble(),
                        onChanged: (value) {
                          context.read<ChatBloc>().add(
                                ChatEvent.seekVoiceMessage(
                                  message.id,
                                  Duration(milliseconds: value.toInt()),
                                  audioPlayer,
                                ),
                              );
                        },
                      ),
                      Text(
                        '${formatDuration(message.totalDuration)} / ${formatDuration(message.currentPosition)}',
                        style: Styles.hintStyle().copyWith(fontSize: 10),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       prettyDuration(position),
                      //       style: const TextStyle(
                      //           fontSize: 10, color: Colors.grey),
                      //     ),
                      //     const Text(
                      //       "M4A",
                      //       style:
                      //           TextStyle(fontSize: 10, color: Colors.grey),
                      //     ),
                      //   ],
                      // ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
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
