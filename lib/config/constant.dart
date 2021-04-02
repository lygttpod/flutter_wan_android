import 'package:flutter/material.dart';
import 'package:flutter_wan_android/data/main_tab.dart';
import 'package:flutter_wan_android/page/category/view.dart';
import 'package:flutter_wan_android/page/home/view.dart';
import 'package:flutter_wan_android/page/mine/view.dart';
import 'package:flutter_wan_android/page/project/view.dart';


class Constant {
  static const String TAB_ID_HOME = "tab_id_home";
  static const String TAB_ID_PROJECT = "tab_id_project";
  static const String TAB_ID_CATEGORY = "tab_id_category";
  static const String TAB_ID_MINE = "tab_id_mine";

  static List<MainTab> mainTab = [
    MainTab(HomePage(), TAB_ID_HOME, Icons.home, "首页"),
    MainTab(ProjectPage(), TAB_ID_PROJECT, Icons.library_books, "项目"),
    MainTab(CategoryPage(), TAB_ID_CATEGORY, Icons.filter, "体系"),
    MainTab(MinePage(), TAB_ID_MINE, Icons.person, "我的"),
  ];
}
