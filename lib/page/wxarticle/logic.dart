import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/category_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class WXArticleLogic extends BaseGetxController {
  var categoryList = <Category>[].obs;

  loadTabData() {
    updatePageStatus(PageStatus.LOADING);
    HttpUtil.getInstance().get("/wxarticle/chapters/json", onSuccess: (data) {
      updatePageStatus(PageStatus.SUCCESS);
      categoryList.assignAll(CategoryModel.fromJson(data).categoryList);
    }, onError: (error) {
      updatePageStatus(PageStatus.ERROR);
    });
  }

  @override
  void onReady() {
    super.onReady();
    loadTabData();
  }
}
