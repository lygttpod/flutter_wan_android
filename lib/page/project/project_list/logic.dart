import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:flutter_wan_android/config/page_status.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/data/home_model.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:flutter_wan_android/page/project/project_list/view.dart';
import 'package:get/get.dart';

class ProjectListLogic extends BaseGetxController {
  var contentList = <ContentModel>[].obs;

  loadTabData(int cid, {PageType pageType = PageType.ProjectArticle}) {
    updatePageStatus(PageStatus.LOADING);
    var path;
    if (pageType == PageType.WenDa) {
      path = "/wenda/list/1/json";
    } else if (pageType == PageType.WXArticle) {
      path = "/wxarticle/list/$cid/1/json";
    } else {
      path = "/project/list/1/json?cid=$cid";
    }
    HttpUtil.getInstance().get(path, onSuccess: (data) {
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
