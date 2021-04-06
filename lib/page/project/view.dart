import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'project_list/view.dart';

class ProjectPage extends StatelessWidget {
  final ProjectLogic logic = Get.put(ProjectLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
        length: logic.tabList.length,
        child: Column(
          children: [
            _buildStatusBar(context),
            _buildTabBar(),
            _buildTabBarView()
          ],
        )));
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.blue,
      child: TabBar(
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          unselectedLabelColor: Colors.white70,
          labelColor: Colors.white,
          isScrollable: true,
          tabs:
              logic.tabList.map((element) => Tab(text: element.name)).toList()),
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(
            children: logic.tabList
                .map((element) => ProjectListPage(element.id))
                .toList()));
  }

  Widget _buildStatusBar(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).padding.top,
        child: Container(color: Colors.blue));
  }
}
