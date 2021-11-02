import 'package:flutter/material.dart';
import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/layout_helper.dart';

class AppTextStyles {
  static TextStyle regularTextStyle = TextStyle(
    fontSize: LayoutHelper.instance?.fontSize,
    color: AppColors.black,
  );

  static TextStyle regularBoldTextStyle = TextStyle(
    fontSize: LayoutHelper.instance?.fontSize,
    fontWeight: FontWeight.bold,
  );

  static TextStyle appBarTextStyle = TextStyle(
    fontSize: LayoutHelper.instance?.titleFontSize,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
}
