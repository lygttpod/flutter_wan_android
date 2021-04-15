import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/project_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class ProjectLogic extends BaseGetxController {
  var tabList = <ProjectTab>[].obs;

  loadTabData() {
    updatePageStatus(PageStatus.LOADING);
    HttpUtil.getInstance().get("/project/tree/json", onSuccess: (data) {
      List<ProjectTab> list = ProjectModel.formatTabData(data).tabs;
      if (list == null || list.isEmpty) {
        updatePageStatus(PageStatus.EMPTY);
      } else {
        updatePageStatus(PageStatus.SUCCESS);
        tabList.assignAll(list);
      }
    }, onError: (error) {
      updatePageStatus(PageStatus.ERROR);
    });
  }
}
