import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_wan_android/config/refresh_utils.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
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
                  itemBuilder: (context, index) => _buildContentWidget(index))),
          pageStatus: logic.pageStatus.value,
          onReplayBtnPressed: () {
            logic.loadData(cid);
          },
        );
      }),
    );
  }

  Widget _buildContentWidget(int index) {
    return InkWell(
        onTap: () => _onItemClick(logic.articleList[index]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              child: Text(logic.articleList[index].title,
                  style: TextStyle(fontSize: 15)),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(getAuthor(logic.articleList[index]),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(getCategory(logic.articleList[index]),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(logic.articleList[index].niceDate,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black45)))),
                  ],
                )),
            Divider(
              height: 0.5,
              color: Colors.blueGrey,
            )
          ],
        ));
  }

  String getAuthor(ContentModel model) {
    if (model.shareUser == null || model.shareUser.isEmpty) {
      return "作者：${model.author}";
    } else {
      return "分享者：${model.shareUser}";
    }
  }

  String getCategory(ContentModel model) {
    return "分类：${model.superChapterName}/${model.chapterName}";
  }

  _onItemClick(ContentModel homeList) {
    Get.toNamed(AppRoutes.WebView,
        arguments: {"title": homeList.title, "url": homeList.link});
  }

  Future<void> doOnRefresh() async {
    await logic.loadData(cid);
  }

  Future<void> doOnLoadMore() async {
    await logic.loadData(cid, isLoadMore: true);
  }
}
