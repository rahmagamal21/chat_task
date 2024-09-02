import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  static const String kFontFamily = 'Noor';

  static TextStyle baseStyle = const TextStyle(
    fontFamily: kFontFamily,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static TextStyle hintStyle() {
    return baseStyle.copyWith(
      fontSize: 12.sp,
      color: const Color(0x1e376c80).withOpacity(0.5),
    );
  }

  static TextStyle messageStyle() {
    return baseStyle.copyWith(
      fontSize: 10.sp,
    );
  }
}
