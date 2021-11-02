import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? label;
  final Color? backgroundColor, textColor;
  final Function? onClick;
  final EdgeInsets? margin;
  final TextStyle? textStyle;
  final Color? borderColor;

  CustomButton({
    this.width = double.infinity,
    this.height = 40,
    this.label,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor,
    this.onClick,
    this.margin = EdgeInsets.zero,
    this.textStyle,
    this.borderColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: TextButton(
        onPressed: () {
          onClick?.call();
        },
        child: Text(label ?? "",
            style: textStyle ??
                AppTextStyles.regularTextStyle
                    .copyWith(color: textColor ?? Colors.white)),
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: borderColor ?? AppColors.backGroundColor),
          ),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}
