import 'package:chat_task/core/common/res/colors.dart';
import 'package:chat_task/core/common/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../generated/l10n.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
                SvgPicture.asset('assets/images/attach-square.svg'),
                SvgPicture.asset('assets/images/microphone.svg'),
                SvgPicture.asset('assets/images/gallery-export.svg'),
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   width: double.infinity,
    //   height: 55.h,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10),
    //     border: Border.all(
    //       width: 0.5,
    //       color: AllColors.border,
    //     ),
    //   ),
    // );
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
}
