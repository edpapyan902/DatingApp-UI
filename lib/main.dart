import 'package:dating_app_redesign/modules/splash/view/splash.dart';
import 'package:dating_app_redesign/utils/navigation/pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      home: Splash(),
    );
  }
}
