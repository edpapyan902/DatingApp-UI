import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final bool isEnabled;
  final bool autoFocus;
  final String? name;
  final TextEditingController? controller;
  final int maxLines;
  final TextStyle? hintStyle;
  final InputBorder? inputBorder;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffix;
  final String? errorText;
  final int? maxLength;

  const InputTextField({
    this.isEnabled = true,
    this.autoFocus = true,
    this.name,
    this.controller,
    this.maxLines = 1,
    this.hintStyle,
    this.inputBorder,
    this.labelStyle,
    this.textStyle,
    this.contentPadding,
    this.suffix,
    this.errorText,
    this.maxLength = 9999,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.grey,
        primaryColorDark: Colors.black,
      ),
      child: TextFormField(
        enabled: isEnabled,
        autofocus: autoFocus,
        controller: controller,
        style: textStyle ?? AppTextStyles.regularTextStyle,
        maxLength: maxLength,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          errorText: errorText,
          suffixIcon: suffix,
          contentPadding: contentPadding,
          hintText: name,
          counterText: "",
          hintStyle: hintStyle ?? AppTextStyles.regularTextStyle,
          focusedBorder: inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
          border: inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
          labelStyle: labelStyle ?? AppTextStyles.regularTextStyle,
        ),
        maxLines: maxLines,
        cursorColor: Colors.grey,
      ),
    );
  }
}
