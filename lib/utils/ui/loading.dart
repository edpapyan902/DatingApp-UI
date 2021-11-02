import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

final spinkit = SpinKitSquareCircle(color: AppColors.primaryColor, size: 50.0);

getLoadingWidget() {
  return spinkit;
}

buildSnackBar({String? title, String? message}) {
  return Get.snackbar(
    title ?? "",
    message ?? "",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.primaryColor,
    colorText: AppColors.white,
  );
}
