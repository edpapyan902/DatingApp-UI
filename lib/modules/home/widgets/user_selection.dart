import 'package:dating_app_redesign/modules/home/model/feed.dart';
import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:dating_app_redesign/utils/layout_helper.dart';
import 'package:dating_app_redesign/utils/ui/custom_button.dart';
import 'package:dating_app_redesign/utils/ui/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSelectionSheet extends StatelessWidget {
  final User? user;
  UserSelectionSheet({this.user});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(user?.picture?.large ?? ""),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          width: LayoutHelper.instance?.width,
          height: 80,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                (user?.name?.first ?? "") +
                    " " +
                    (user?.name?.last ?? "") +
                    ", " +
                    (user?.dob?.age.toString() ?? ""),
                style: AppTextStyles.regularBoldTextStyle,
              ),
              const SizedBox(height: 5),
              Text(
                (user?.location?.city ?? "") +
                    "," +
                    (user?.location?.state ?? "") +
                    "," +
                    (user?.location?.country ?? ""),
                style: AppTextStyles.regularBoldTextStyle
                    .copyWith(color: AppColors.subTitle),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black.withOpacity(.25),
              ),
              child: IconButton(
                iconSize: 40,
                onPressed: () {
                  Get.back();
                  buildSnackBar(
                    title: 'Sucess',
                    message: "User Removed from Suggestion List",
                  );
                },
                icon: Icon(
                  Icons.clear,
                  color: AppColors.white.withOpacity(.5),
                ),
              ),
            ).paddingOnly(right: 10),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.heartColor.withOpacity(.25),
              ),
              child: IconButton(
                iconSize: 40,
                onPressed: () {
                  Get.back();
                  buildSnackBar(
                    title: 'Sucess',
                    message: "User Added to Favorite List",
                  );
                },
                icon: Icon(
                  Icons.favorite,
                  color: AppColors.heartColor,
                ),
              ),
            ).paddingOnly(right: 15)
          ],
        ).marginOnly(bottom: 100),
      ],
    );
  }
}
