import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final TextEditingController ageTxtController = TextEditingController();
  RxBool isLoading = false.obs;

  String? selectedgender;
  int? age;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
