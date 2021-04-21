import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/hot_search_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class SearchLogic extends GetxController {
  var hotSearchList = <HotSearch>[].obs;
  var searchResultList = <ContentModel>[].obs;

  var key = "".obs;

  loadHotSearch() {
    HttpUtil.getInstance().get("/hotkey/json",
        onSuccess: (data) => {
              hotSearchList
                  .assignAll(HotSearchModel.fromJson(data).hotSearchList)
            });
  }

  searchKey(String key) {
    HttpUtil.getInstance().post("/article/query/0/json", {"k": key},
        onSuccess: (data) => {
              searchResultList.assignAll(
                  HotSearchModel.fromJsonForResult(data["datas"])
                      .searchResultList)
            });
  }

  @override
  void onReady() {
    super.onReady();
    loadHotSearch();
  }
}
