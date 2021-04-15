import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/config/page_status.dart';

class AppPageStatusWidget extends StatelessWidget {
  final PageStatus pageStatus;
  final Widget child;

  final Function onReplayBtnPressed;

  const AppPageStatusWidget({this.child, this.pageStatus, this.onReplayBtnPressed}) : super();

  @override
  Widget build(BuildContext context) {
    return appPageStatusWidget(child, pageStatus ?? PageStatus.SUCCESS, onReplayBtnPressed);
  }

  Widget appPageStatusWidget(Widget successWidget,PageStatus pageStatus,  Function onReplayBtnPressed) {
    switch (pageStatus) {
      case PageStatus.LOADING:
        return appLoadingPage();
        break;
      case PageStatus.ERROR:
        return appErrorPage(onReplayBtnPressed);
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

  Widget appErrorPage(Function onReplayBtnPressed) {
    return Center(
      child: Column(
        children: [
          Text("页面出错啦"),
          ElevatedButton(onPressed: onReplayBtnPressed, child: Text("点击重试"))
        ],
      ),
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
}
