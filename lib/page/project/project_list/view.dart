import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProjectListPage extends StatelessWidget {
  final int cid;

  ProjectListLogic logic;

  ProjectListPage(this.cid) {
    logic = Get.put(ProjectListLogic(cid), tag: "ProjectListLogic$cid");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildListWidget(),
    );
  }

  Widget _buildListWidget() {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: logic.contentList.length,
        itemBuilder: (_, index) {
          return _buildItemWidget(index);
        }));
  }

  Widget _buildItemWidget(int index) {
    return InkWell(
        onTap: () => _onItemClick(logic.contentList[index]),
        child: Column(
          children: [
            Row(
              children: [
                _buildCoverWidget(logic.contentList[index].envelopePic),
                _buildContentWidget(logic.contentList[index])
              ],
            ),
            Divider(
              height: 0.5,
              color: Colors.blueGrey,
            )
          ],
        ));
  }

  Widget _buildCoverWidget(String cover) {
    return Container(
        margin: EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
        height: 120,
        width: 60,
        child: Image.network(cover, fit: BoxFit.fill));
  }

  Widget _buildContentWidget(ContentModel content) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildItemTitleWidget(content),
        _buildItemDesWidget(content),
        _buildItemBottomWidget(content),
      ],
    ));
  }

  Widget _buildItemTitleWidget(ContentModel content) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Text(
        content.title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildItemDesWidget(ContentModel content) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Text(content.desc,
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildItemBottomWidget(ContentModel content) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            Text(getAuthor(content),
                style: TextStyle(fontSize: 10, color: Colors.black45)),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(content.niceDate,
                        style:
                            TextStyle(fontSize: 10, color: Colors.black45)))),
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

  _onItemClick(ContentModel content) {
    Get.toNamed(AppRoutes.WebView,
        arguments: {"title": content.title, "url": content.link});
  }
}
