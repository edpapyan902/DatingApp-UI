import 'dart:async';

import 'package:dating_app_redesign/utils/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:dating_app_redesign/utils/layout_helper.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Get.toNamed(AppRoute.ONBOARDING);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LayoutHelper();
    LayoutHelper.instance?.width = Get.width;
    LayoutHelper.instance?.height = Get.height;
    LayoutHelper.instance?.fontSize = Get.width > 300 ? 16 : 14;
    LayoutHelper.instance?.titleFontSize = Get.width > 300 ? 22 : 20;
    return Scaffold(
      body: Center(
        child: Text("People Interactive Test - Suraj Lad"),
      ),
    );
  }
}
