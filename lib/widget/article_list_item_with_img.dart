import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

class ArticleListItemWithImg extends StatelessWidget {
  final ContentModel article;
  final int index;

  ArticleListItemWithImg(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return _buildItemWidget(article, index);
  }

  Widget _buildItemWidget(ContentModel article, int index) {
    return InkWell(
        onTap: () => _onItemClick(article),
        child: Column(
          children: [
            Row(
              children: [
                _buildCoverWidget(article.envelopePic),
                _buildContentWidget(article)
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
        child: Container(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemTitleWidget(content),
          _buildItemDesWidget(content),
          _buildItemBottomWidget(content),
        ],
      ),
    ));
  }

  Widget _buildItemTitleWidget(ContentModel content) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 20),
      child: Text(
        content.title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildItemDesWidget(ContentModel content) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Text(content.desc,
          style: TextStyle(fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildItemBottomWidget(ContentModel content) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 20),
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

  _onItemClick(ContentModel homeList) {
    Get.toNamed(AppRoutes.WebView,
        arguments: {"title": homeList.title, "url": homeList.link});
  }
}
