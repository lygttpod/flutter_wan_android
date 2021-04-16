import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ProjectListLogic extends BaseGetxController {
  var contentList = <ContentModel>[].obs;

  loadTabData(int cid) {
    updatePageStatus(PageStatus.LOADING);
    HttpUtil.getInstance().get("/project/list/1/json?cid=$cid",
        onSuccess: (data) {
      var list = HomeModel.fromJson(data["datas"]).contents;
      if (list == null || list.length == 0) {
        updatePageStatus(PageStatus.EMPTY);
      } else {
        updatePageStatus(PageStatus.SUCCESS);
        contentList.assignAll(list);
      }
    }, onError: (error) {
      updatePageStatus(PageStatus.ERROR);
    });
  }
}
