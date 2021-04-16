import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/article_list_item.dart';
import 'package:flutter_wan_android/widget/article_list_item_with_img.dart';
import 'package:get/get.dart';

import 'logic.dart';

enum PageType { WXArticle, ProjectArticle, WenDa }

class ProjectListPage extends StatefulWidget {
  final int cid;
  final PageType pageType;

  ProjectListPage(this.cid, {this.pageType = PageType.ProjectArticle});

  @override
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  ProjectListLogic logic;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    logic = Get.put(ProjectListLogic(), tag: "ProjectListLogic${widget.cid}");
    logic.loadTabData(widget.cid, pageType: widget.pageType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Obx(() => _buildListWidget()),
    );
  }

  Widget _buildListWidget() {
    return AppPageStatusWidget(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: logic.contentList.length,
          itemBuilder: (_, index) {
            return _buildItemWidget(logic.contentList[index], index);
          }),
      pageStatus: logic.pageStatus.value,
      onReplayBtnPressed: () =>
          logic.loadTabData(widget.cid, pageType: widget.pageType),
    );
  }

  Widget _buildItemWidget(ContentModel article, int index) {
    if (widget.pageType == PageType.WXArticle) {
      return ArticleListItem(article, index);
    } else if (widget.pageType == PageType.WenDa) {
      return ArticleListItem(article, index);
    } else {
      return ArticleListItemWithImg(article, index);
    }
  }
}
