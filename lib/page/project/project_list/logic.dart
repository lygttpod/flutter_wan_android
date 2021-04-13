import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ProjectListLogic extends BaseGetxController {
  final int cid;
  var contentList = <ContentModel>[].obs;

  ProjectListLogic(this.cid);

  loadTabData() {
    HttpUtil.getInstance().get("/project/list/1/json?cid=$cid",
        onSuccess: (data) {
          updatePageStatus(PageStatus.SUCCESS);
          contentList.assignAll(HomeModel
              .fromJson(data["datas"])
              .contents);
        }, onError: (error) {
          updatePageStatus(PageStatus.ERROR);
        });
  }
}
