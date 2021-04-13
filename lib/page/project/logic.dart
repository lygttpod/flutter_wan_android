import 'package:flutter_wan_android/data/project_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ProjectLogic extends GetxController {
  var tabList = <ProjectTab>[].obs;

  loadTabData() {
    HttpUtil.getInstance().get("/project/tree/json",
        onSuccess: (data) =>
            {tabList.assignAll(ProjectModel.formatTabData(data).tabs)});
  }
}
