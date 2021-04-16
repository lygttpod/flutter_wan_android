import 'package:flutter/material.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/article_list_item_with_img.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProjectListPage extends StatefulWidget {
  final int cid;

  ProjectListPage(this.cid);

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
    logic.loadTabData(widget.cid);
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
            return ArticleListItemWithImg(logic.contentList[index], index);
          }),
      pageStatus: logic.pageStatus.value,
      onReplayBtnPressed: () => logic.loadTabData(widget.cid),
    );
  }
}
