import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/config/refresh_utils.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/article_list_item.dart';
import 'package:flutter_wan_android/widget/common_app_bar.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ArticleListPage extends StatelessWidget {
  final ArticleListLogic logic = Get.put(ArticleListLogic());

  final String title = Get.arguments["title"];
  final int cid = Get.arguments["cid"];

  final EasyRefreshController easyRefreshController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title),
      body: Obx(() {
        easyRefreshController.finishLoad(
            success: true, noMore: logic.isLoadFinish.value);
        return AppPageStatusWidget(
          child: EasyRefresh(
              controller: easyRefreshController,
              header: RefreshUtils().appRefreshHeader(),
              footer: RefreshUtils().appRefreshFooter(),
              onRefresh: doOnRefresh,
              onLoad: doOnLoadMore,
              child: ListView.builder(
                  itemCount: logic.articleList.length,
                  itemBuilder: (context, index) =>
                      ArticleListItem(logic.articleList[index], index))),
          pageStatus: logic.pageStatus.value,
          onReplayBtnPressed: () {
            logic.loadData(cid);
          },
        );
      }),
    );
  }

  Future<void> doOnRefresh() async {
    await logic.loadData(cid);
  }

  Future<void> doOnLoadMore() async {
    await logic.loadData(cid, isLoadMore: true);
  }
}
