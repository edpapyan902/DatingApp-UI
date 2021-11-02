import 'package:dating_app_redesign/modules/home/model/feed.dart';
import 'package:dating_app_redesign/utils/app_constants/constants.dart';
import 'package:get/get.dart';

class API extends GetConnect {
  Future<List<User>?> getMatchingFeed() async {
    List<User>? feed = [];

    await get(AppConstants().baseUrl).then(
      (response) {
        print(response.statusCode);

        if (response.statusCode == 200) {
          feed = DatingMatches.fromJson(response.body).results;
          print(feed?.length ?? "");
        }
      },
    );
    // ).catchError(
    //   (onError) {
    //     print("onError " + onError.toString());
    //   },
    // );
    return feed;
  }
}
