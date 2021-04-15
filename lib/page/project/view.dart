import 'package:flutter/material.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'project_list/view.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with AutomaticKeepAliveClientMixin {
  final ProjectLogic logic = Get.put(ProjectLogic());

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    logic.loadTabData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => AppPageStatusWidget(
          child: DefaultTabController(
              length: logic.tabList.length,
              child: Column(
                children: [
                  _buildStatusBar(context),
                  _buildTabBar(),
                  _buildTabBarView()
                ],
              )),
          pageStatus: logic.pageStatus.value,
          onReplayBtnPressed: () => logic.loadTabData(),
        ));
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
