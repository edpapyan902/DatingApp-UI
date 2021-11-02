import 'package:dating_app_redesign/api/api_client.dart';
import 'package:dating_app_redesign/modules/home/model/feed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<User>? matchingFeed = [];
  var selectedPage;
  PageController? pageController;

  @override
  void onInit() async {
    matchingFeed = await API().getMatchingFeed();
    pageController = PageController(initialPage: 0);
    update();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
