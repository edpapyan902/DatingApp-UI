import 'package:dating_app_redesign/modules/home/widgets/user_selection.dart';
import 'package:dating_app_redesign/modules/home/widgets/user_tile.dart';
import 'package:dating_app_redesign/utils/app_constants/assets.dart';
import 'package:dating_app_redesign/utils/ui/loading.dart';
import 'package:flutter/material.dart';
import 'package:dating_app_redesign/modules/home/controller/home_controller.dart';
import 'package:dating_app_redesign/utils/app_constants/colors.dart';
import 'package:dating_app_redesign/utils/app_constants/text_styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dating App",
                  style: AppTextStyles.appBarTextStyle,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.subTitle,
                  child: Icon(
                    Icons.person,
                    color: AppColors.white,
                  ),
                ),
              ],
            ).paddingOnly(left: 20, bottom: 10, top: 20, right: 20),
            buildPageTitleWidget().paddingOnly(left: 20, bottom: 20, top: 10),
            Expanded(
              child: PageView(
                controller: homeController.pageController,
                children: <Widget>[
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return buildMatchingResults();
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Coming Soon"),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Coming Soon"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageTitleWidget() {
    return GetBuilder<HomeController>(builder: (controller) {
      return Wrap(
        children: [
          ChoiceChip(
            shape: CircleBorder(),
            padding: const EdgeInsets.all(15),
            selected: homeController.selectedPage == "Feed",
            label: Icon(
              Icons.list,
              color: AppColors.primaryColor,
            ),
            onSelected: (value) {
              homeController.selectedPage = "Feed";
              homeController.pageController?.animateToPage(0,
                  duration: Duration(seconds: 1), curve: Curves.bounceIn);
              homeController.update();
            },
            selectedColor: AppColors.primaryColor.withOpacity(.65),
            backgroundColor: AppColors.primaryColor.withOpacity(.25),
          ),
          const SizedBox(width: 10),
          ChoiceChip(
            shape: CircleBorder(),
            padding: const EdgeInsets.all(15),
            selected: homeController.selectedPage == "Location",
            label: Icon(
              Icons.place,
              color: AppColors.primaryColor,
            ),
            onSelected: (value) {
              homeController.selectedPage = "Location";
              homeController.pageController?.animateToPage(1,
                  duration: Duration(seconds: 1), curve: Curves.bounceIn);
              homeController.update();
            },
            selectedColor: AppColors.primaryColor.withOpacity(.65),
            backgroundColor: AppColors.primaryColor.withOpacity(.25),
          ),
          const SizedBox(width: 10),
          ChoiceChip(
            shape: CircleBorder(),
            padding: const EdgeInsets.all(15),
            selected: homeController.selectedPage == "Fav",
            label: Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
            ),
            onSelected: (value) {
              homeController.selectedPage = "Fav";
              homeController.pageController?.animateToPage(2,
                  duration: Duration(seconds: 1), curve: Curves.bounceIn);
              homeController.update();
            },
            selectedColor: AppColors.primaryColor.withOpacity(.65),
            backgroundColor: AppColors.primaryColor.withOpacity(.25),
          ),
        ],
      );
    });
  }

  Widget buildMatchingResults() {
    return (homeController.matchingFeed?.isEmpty ?? false)
        ? Container(
            width: 40,
            height: 40,
            child: getLoadingWidget(),
          )
        : StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: homeController.matchingFeed?.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 1) {
                return buildPopularWidget().marginOnly(left: 5, right: 5);
              }
              return InkWell(
                onTap: () {
                  Get.bottomSheet(
                    UserSelectionSheet(
                      user: homeController.matchingFeed?[index],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                      ),
                    ),
                  );
                },
                child: UserTile(
                  user: homeController.matchingFeed?[index],
                ),
              );
            },
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, (index == 1) ? 2 : 3),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          );
  }

  Stack buildPopularWidget() {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22),
              topRight: Radius.circular(22),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.heartColor.withOpacity(.25),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Become Popular\nVerify Account And Stay Active and get popular,',
              textAlign: TextAlign.center,
              style: AppTextStyles.regularTextStyle.copyWith(),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 25,
          child: Image.asset(
            AppAssets.rHeart,
            height: 80,
          ),
        ),
      ],
    );
  }
}
