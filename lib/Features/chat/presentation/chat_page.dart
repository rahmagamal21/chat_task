import 'package:chat_task/Features/chat/presentation/views/widgets/chat_header.dart';
import 'package:chat_task/Features/chat/presentation/views/widgets/input_field.dart';
import 'package:chat_task/core/common/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemBuilder: (context, index) {},
                    ),
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
