import 'package:dating_app_redesign/modules/home/model/feed.dart';
import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTile extends StatelessWidget {
  final User? user;
  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    var subTitle;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                user?.picture?.large ?? "",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            (user?.name?.first ?? "") +
                " " +
                (user?.name?.last ?? "") +
                ", " +
                (user?.dob?.age.toString() ?? ""),
            style: AppTextStyles.regularBoldTextStyle,
          ).paddingOnly(left: 10, right: 10),
          const SizedBox(height: 5),
          Text(
            (user?.location?.city ?? ""),
            style: AppTextStyles.regularBoldTextStyle
                .copyWith(color: AppColors.subTitle),
          ).paddingOnly(left: 10, right: 10),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
