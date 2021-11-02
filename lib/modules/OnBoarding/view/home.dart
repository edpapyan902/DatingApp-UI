import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/app_constants/constants.dart';
import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:dating_app_redesign/utils/app_constants/assets.dart';
import 'package:dating_app_redesign/utils/navigation/routes.dart';
import 'package:dating_app_redesign/utils/ui/custom_button.dart';
import 'package:dating_app_redesign/utils/ui/input_textfield.dart';
import 'package:flutter/material.dart';
import 'package:dating_app_redesign/modules/OnBoarding/controller/user_post_controller.dart';
import 'package:get/get.dart';

class OnboardingHome extends StatelessWidget {
  final OnboardingController onboardingController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<OnboardingController>(
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "About You",
                    style: AppTextStyles.appBarTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  buildGenderSelectionWIdget(),
                  const SizedBox(height: 10),
                  Text("Age :"),
                  InputTextField(
                    autoFocus: false,
                    name: "Eg. 24",
                    controller: onboardingController.ageTxtController,
                    textStyle: AppTextStyles.regularTextStyle,
                    maxLength: 2,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    label: "Lets Match",
                    height: 50,
                    onClick: () {
                      onboardingController.age = int.tryParse(
                              onboardingController.ageTxtController.text) ??
                          24;
                      Get.toNamed(AppRoute.HOME);
                    },
                    textStyle: AppTextStyles.regularBoldTextStyle
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ).paddingOnly(left: 25, right: 25, top: 30);
            },
          ),
        ),
      ),
    );
  }

  Widget buildGenderSelectionWIdget() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: getGenderTiles(),
    );
  }

  getGenderTiles() {
    List<Widget> tiles = [];

    for (int i = 0; i < AppConstants.gender.length; i++) {
      tiles.add(
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            children: [
              ChoiceChip(
                shape: RoundedRectangleBorder(),
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                selected: onboardingController.selectedgender ==
                    AppConstants.gender[i],
                label: Image.asset(
                  AppConstants.gender[i] == "Male"
                      ? AppAssets.gMale
                      : AppAssets.gFenale,
                  height: 120,
                ).paddingOnly(bottom: 10),
                onSelected: (value) {
                  onboardingController.selectedgender = AppConstants.gender[i];
                  onboardingController.update();
                },
                selectedColor: AppColors.primaryColor.withOpacity(.25),
                backgroundColor: AppColors.backGroundColor,
              ),
              const SizedBox(height: 10),
              Text(
                AppConstants.gender[i],
                style: AppTextStyles.regularBoldTextStyle.copyWith(
                    color: onboardingController.selectedgender ==
                            AppConstants.gender[i]
                        ? AppColors.primaryColor
                        : AppColors.black),
              ),
            ],
          ),
        ),
      );
    }
    return tiles;
  }
}
