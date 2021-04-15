import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/category_model.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/common_app_bar.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  final CategoryLogic logic = Get.put(CategoryLogic());

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
    return Scaffold(
      appBar: commonAppBar("分类"),
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Obx(() => AppPageStatusWidget(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: logic.categoryList.length,
              itemBuilder: (_, index) {
                return _buildItemWidget(logic.categoryList[index]);
              }),
          pageStatus: logic.pageStatus.value,
          onReplayBtnPressed: () => logic.loadTabData(),
        ));
  }

  Widget _buildItemWidget(Category category) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCategoryTitle(category),
          _buildCategoryChild(category),
        ],
      ),
    );
  }

  Widget _buildCategoryTitle(Category category) {
    return Container(
      child: Text(
        "${category.name}",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryChild(Category category) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 10),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children:
            category.children.map((e) => _buildCategoryChildItem(e)).toList(),
      ),
    );
  }

  Widget _buildCategoryChildItem(Category category) {
    return InkWell(
        onTap: () => _onItemClick(category),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.blue),
          child: Container(
            padding: EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
            child: Text(category.name, style: TextStyle(color: Colors.white)),
          ),
        ));
  }

  _onItemClick(Category category) {
    print(category.name);
  }
}
