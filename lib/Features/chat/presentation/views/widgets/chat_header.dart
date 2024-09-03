import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/call.svg'),
        SvgPicture.asset(
          'assets/images/maskgroup.svg',
          width: 60.w,
          height: 60.h,
        ),
        SvgPicture.asset('assets/images/points.svg'),
      ],
    );
  }
}
