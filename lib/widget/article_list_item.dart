import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

class ArticleListItem extends StatelessWidget {
  final ContentModel article;
  final int index;

  ArticleListItem(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return _buildArticleItemWidget(article, index);
  }

  Widget _buildArticleItemWidget(ContentModel model, int index) {
    return InkWell(
        onTap: () => _onItemClick(model),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              child: Text(model.title, style: TextStyle(fontSize: 15)),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(getAuthor(model),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(getCategory(model),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(model.niceDate,
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
}
