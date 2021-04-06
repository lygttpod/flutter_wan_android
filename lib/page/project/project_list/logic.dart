import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ProjectListLogic extends GetxController {
  final int cid;
  var contentList = <ContentModel>[].obs;

  ProjectListLogic(this.cid);

  loadTabData() {
    HttpUtil.getInstance().get("/project/list/1/json?cid=$cid",
        onSuccess: (data) {
      contentList.assignAll(HomeModel.fromJson(data["datas"]).contents);
    });
  }

  @override
  void onReady() {
    super.onReady();
    loadTabData();
  }
}
