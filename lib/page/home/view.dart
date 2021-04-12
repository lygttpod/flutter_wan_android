import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wan_android/data/content_model.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  final HomeLogic logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Get.toNamed(AppRoutes.searchPage))
        ],
      ),
      body: Column(
        children: [
          _buildBannerWidget(),
          Expanded(
            child: _buildListWidget(),
          )
        ],
      ),
    );
  }

  Widget _buildListWidget() {
    return Obx(() => ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: logic.homeList.length,
        itemBuilder: (_, index) {
          return _buildContentWidget(index);
        }));
  }

  Widget _buildBannerWidget() {
    return Container(
      height: 190,
      child: Obx(() => Swiper(
            onTap: _onBannerClick,
            autoplay: true,
            itemCount: logic.banners.length,
            itemBuilder: (context, index) {
              return Image.network(logic.banners[index].imagePath,
                  fit: BoxFit.fitWidth);
            },
          )),
    );
  }

  Widget _buildContentWidget(int index) {
    return InkWell(
        onTap: () => _onItemClick(logic.homeList[index]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
              child: Text(logic.homeList[index].title,
                  style: TextStyle(fontSize: 15)),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Text(getAuthor(logic.homeList[index]),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(getCategory(logic.homeList[index]),
                        style: TextStyle(fontSize: 10, color: Colors.black45)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(logic.homeList[index].niceDate,
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

  _onBannerClick(int index) {
    Get.snackbar("", logic.banners[index].title,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(milliseconds: 500));
  }

  _onItemClick(ContentModel homeList) {
    Get.toNamed(AppRoutes.WebView,
        arguments: {"title": homeList.title, "url": homeList.link});
  }
}
