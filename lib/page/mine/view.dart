import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_wan_android/utils/color_utils.dart';
import 'package:flutter_wan_android/widget/app_page_status_widget.dart';
import 'package:flutter_wan_android/widget/common_horizontal_item.dart';
import 'package:flutter_wan_android/widget/common_vertical_item.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  final MineLogic logic = Get.put(MineLogic());

  final String slogan = "Great People Share Knowledge!";

  @override
  Widget build(BuildContext context) {
    return AppPageStatusWidget(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _buildHeaderWidget(),
              _buildActionWidget(),
              _buildOtherWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: 200,
              child: Image.asset("assets/images/img_mine_top_bg.jpg",
                  fit: BoxFit.fitHeight)),
          Center(
            child: _buildSloganWidget(),
          )
        ],
      ),
    );
  }

  Widget _buildSloganWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10,bottom: 10),
      alignment: Alignment.center,
      child: Text.rich(TextSpan(
          children: slogan
              .split("")
              .map((word) => TextSpan(
              text: word,
              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)))
              .toList())),
    );
  }
  Widget _buildActionWidget() {
    return Card(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Container(
        height: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          CommonVerticalItem(
            iconData: Icons.score,
            text: "积分",
            onPressed: () => {},
          ),
          CommonVerticalItem(
            iconData: Icons.question_answer,
            text: "问答",
            onPressed: () => {},
          ),
          CommonVerticalItem(
            iconData: Icons.collections_bookmark,
            text: "收藏",
            onPressed: () => {},
          ),
          CommonVerticalItem(
            iconData: Icons.settings,
            text: "设置",
            onPressed: () => {},
          ),
        ]),
      ),
    );
  }

  Widget _buildOtherWidget() {
    return Container(
      child: Column(
        children: [
          CommonHorizontalItem(
            iconData: Icons.whatshot_rounded,
            text: "热搜榜",
            onPressed: () => {},
          ),
          CommonHorizontalItem(
            iconData: Icons.article_rounded,
            text: "公众号",
            onPressed: () => {},
          ),
          CommonHorizontalItem(
            iconData: Icons.language_rounded,
            text: "常用网站",
            onPressed: () => {},
          ),
          CommonHorizontalItem(
            iconData: Icons.navigation_rounded,
            text: "导航数据",
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
