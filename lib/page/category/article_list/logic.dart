import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ArticleListLogic extends BaseGetxController {
  var page = 0;
  var articleList = <ContentModel>[].obs;

  var isLoadFinish = false.obs;

  loadData(int cid, {bool isLoadMore = false}) {
    if (!isLoadMore) {
      updatePageStatus(PageStatus.LOADING);
      page = 0;
    }
    HttpUtil.getInstance().get("/article/list/$page/json?cid=$cid",
        onSuccess: (data) {
      page++;
      updatePageStatus(PageStatus.SUCCESS);
      var newData = HomeModel.fromJson(data["datas"]).contents;
      if (isLoadMore) {
        articleList.addAll(newData);
      } else {
        articleList.assignAll(newData);
      }
      if (newData == null || newData.length != 20) {
        isLoadFinish.value = true;
      }
    }, onError: (error) {
      updatePageStatus(PageStatus.ERROR);
    });
  }

  @override
  void onReady() {
    super.onReady();
    int cid = Get.arguments["cid"];
    loadData(cid);
  }
}
