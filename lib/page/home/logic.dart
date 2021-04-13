import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/banner.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class HomeLogic extends BaseGetxController {
  var banners = <Banner>[].obs;

  var homeList = <ContentModel>[].obs;

  loadBannerData() {
    HttpUtil.getInstance().get("/banner/json",
        onSuccess: (data) =>
            {banners.assignAll(BannerModel.fromJson(data).banners)});
  }

  loadHomeData() {
    HttpUtil.getInstance().get("/article/list/0/json", onSuccess: (data) {
      updatePageStatus(PageStatus.SUCCESS);
      homeList.assignAll(HomeModel.fromJson(data["datas"]).contents);
    }, onError: (error) {
      updatePageStatus(PageStatus.ERROR);
    });
  }

  loadData() {
    loadBannerData();
    loadHomeData();
  }
}
