import 'package:chat_task/core/common/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_message_package/voice_message_package.dart';
import '../../controller/chat/chat_bloc.dart';
import '../../controller/message.dart';

class AudioBubble extends StatefulWidget {
  const AudioBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  State<AudioBubble> createState() => _AudioBubbleState();
}

class _AudioBubbleState extends State<AudioBubble> {
  static VoiceController? _currentlyPlayingController;

  late final VoiceController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VoiceController(
      audioSrc: widget.message.content,
      maxDuration: widget.message.totalDuration,
      isFile: true,
      onComplete: _onComplete,
      onPause: _onPause,
      onPlaying: _onPlaying,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onComplete() {
    if (_currentlyPlayingController == _controller) {
      _currentlyPlayingController = null;
    }
  }

  void _onPause() {}

  void _onPlaying() {
    if (_currentlyPlayingController != null &&
        _currentlyPlayingController != _controller) {
      _currentlyPlayingController!.pausePlaying();
    }

    _currentlyPlayingController = _controller;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return VoiceMessageView(
          //backgroundColor: Colors.transparent,
          activeSliderColor: Colors.blue,
          //notActiveSliderColor: AllColors.sendBubble.withOpacity(0.04),
          circlesColor: AllColors.lightBlue,
          innerPadding: 0,
          controller: _controller,
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
