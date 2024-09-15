import 'package:chat_task/core/common/res/colors.dart';
import 'package:chat_task/core/common/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';
import '../../controller/chat/chat_bloc.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return state.isRecording
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: AllColors.border,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded(
                    //   child: AudioWaveforms(
                    //     recorderController: chatBloc.record,
                    //     size: Size(MediaQuery.of(context).size.width * 0.7, 50),
                    //     waveStyle: const WaveStyle(
                    //       waveColor: Colors.blue,
                    //       spacing: 8.0,
                    //       showMiddleLine: false,
                    //     ),
                    //   ),
                    // ),
                    Text(formatDurationFromSeconds(state.recordingTime)),

                    // Text("${state.recordingTime} sec"),
                    // const SizedBox.expand(
                    //     //width: 10.w,
                    //     ),
                    IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: () {
                        chatBloc.add(const ChatEvent.sendVoiceRecording());
                      },
                    ),
                  ],
                ),
              )
            : TextFormField(
                controller: chatBloc.controller,
                decoration: InputDecoration(
                  border: border(),
                  focusedBorder: border(),
                  enabledBorder: border(),
                  disabledBorder: border(),
                  hintText: S.of(context).write_your_message,
                  hintStyle: Styles.hintStyle(),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 130.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset(
                                'assets/images/attach-square.svg'),
                            onTap: () => chatBloc.pickFile(),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                                'assets/images/microphone.svg'),
                            onTap: () =>
                                chatBloc.add(const ChatEvent.startRecording()),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                                'assets/images/gallery-export.svg'),
                            onTap: () => chatBloc.pickImage(),
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff1E376C),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.h),
                                child: SvgPicture.asset(
                                  'assets/images/send.svg',
                                ),
                              ),
                            ),
                            onTap: () {
                              chatBloc.add(const ChatEvent.sendMessage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0.5,
        color: AllColors.border,
      ),
    );
  }

  String formatDurationFromSeconds(int totalSeconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(totalSeconds ~/ 60); // Get the whole minutes
    final seconds = twoDigits(totalSeconds % 60); // Get the remaining seconds
    return '$minutes:$seconds';
  }
}
