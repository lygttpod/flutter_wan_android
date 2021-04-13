import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/config/page_status.dart';


Widget appPageStatusWidget(PageStatus pageStatus, Widget successWidget) {
  switch (pageStatus) {
    case PageStatus.LOADING:
      return appLoadingPage();
      break;
    case PageStatus.ERROR:
      return appErrorPage();
      break;
    case PageStatus.EMPTY:
      return appEmptyPage();
      break;
    case PageStatus.SUCCESS:
      return successWidget;
      break;
    default:
      return appEmptyPage();
  }
}

Widget appErrorPage() {
  return Center(
    child: Text("页面出错啦"),
  );
}

Widget appEmptyPage() {
  return Center(
    child: Text("暂无数据"),
  );
}
Widget appLoadingPage() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
