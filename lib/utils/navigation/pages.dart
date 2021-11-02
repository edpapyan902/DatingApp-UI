import 'package:dating_app_redesign/modules/OnBoarding/view/home.dart';
import 'package:dating_app_redesign/modules/home/view/home.dart';
import 'package:dating_app_redesign/modules/splash/view/splash.dart';
import 'package:dating_app_redesign/utils/navigation/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoute.SPLASH,
      page: () => Splash(),
    ),
    GetPage(
      name: AppRoute.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: AppRoute.ONBOARDING,
      page: () => OnboardingHome(),
    ),
  ];
}
