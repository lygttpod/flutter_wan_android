import 'package:flutter/material.dart';
import 'package:flutter_wan_android/page/project/project_list/view.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WXArticlePage extends StatelessWidget {
  final WXArticleLogic logic = Get.put(WXArticleLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => AppPageStatusWidget(
              child: DefaultTabController(
                  length: logic.categoryList.length,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("公众号"),
                      centerTitle: true,
                      actions: [
                        IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () => Get.toNamed(AppRoutes.searchPage))
                      ],
                      bottom: _buildTabBar(),
                    ),
                    body: _buildTabBarView(),
                  )),
              pageStatus: logic.pageStatus.value,
              onReplayBtnPressed: () => logic.loadTabData(),
            )));
  }

  Widget _buildTabBar() {
    return TabBar(
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        unselectedLabelColor: Colors.white70,
        labelColor: Colors.white,
        isScrollable: true,
        tabs: logic.categoryList
            .map((element) => Tab(text: element.name))
            .toList());
  }

  Widget _buildTabBarView() {
    return TabBarView(
        children: logic.categoryList
            .map((element) =>
                ProjectListPage(element.id, pageType: PageType.WXArticle))
            .toList());
  }
}
