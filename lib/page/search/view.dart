import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/hot_search_model.dart';
import 'package:flutter_wan_android/widget/article_list_item.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SearchPage extends StatelessWidget {
  final SearchLogic logic = Get.put(SearchLogic());

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchWidget(),
        titleSpacing: 0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildSearchWidget() {
    return Container(
      padding: EdgeInsets.only(right: 15),
      alignment: Alignment.centerLeft,
      height: 38,
      child: TextField(
          controller: textController,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: "请输入搜索内容",
              hintStyle: TextStyle(color: Colors.white)),
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.redAccent,
          onChanged: (key) => onInputChanged(key)),
    );
  }

  onInputChanged(String key) {
    if (key == null || key.isEmpty) {
      logic.searchResultList.clear();
    } else {
      logic.searchKey(key);
    }
    logic.key.value = key;
  }

  Widget _buildContent() {
    return Obx(() {
      if (logic.searchResultList.isNotEmpty) {
        return _buildSearchResultWidget();
      } else {
        if (logic.key.isEmpty) {
          return _buildHotSearchWidget();
        } else {
          return Center(
            child: Text("没有搜索到内容哦，换个词试试吧！"),
          );
        }
      }
    });
  }

  Widget _buildHotSearchWidget() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children:
            logic.hotSearchList.map((e) => _buildCategoryChildItem(e)).toList(),
      ),
    );
  }

  Widget _buildCategoryChildItem(HotSearch hotSearch) {
    return InkWell(
        onTap: () => _onItemClick(hotSearch),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.blue),
          child: Container(
            padding: EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
            child: Text(hotSearch.name, style: TextStyle(color: Colors.white)),
          ),
        ));
  }

  _onItemClick(HotSearch hotSearch) {
    textController.text = hotSearch.name;
    logic.searchKey(hotSearch.name);
  }

  Widget _buildSearchResultWidget() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: logic.searchResultList.length,
        itemBuilder: (_, index) {
          return ArticleListItem(logic.searchResultList[index], index);
        });
  }
}
