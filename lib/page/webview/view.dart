import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'logic.dart';

class WebViewPage extends StatelessWidget {
  final WebViewLogic logic = Get.put(WebViewLogic());

  final String title = Get.arguments["title"];
  final String url = Get.arguments["url"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildWebViewAppBar(), body: _buildContentWidget());
  }

  Widget _buildContentWidget() {
    return Obx(() {
      return Stack(
        children: [_buildWebViewWidget(), _buildLoadingWidget()],
      );
    });
  }

  Widget _buildLoadingWidget() {
    return Visibility(
        // ignore: unrelated_type_equality_checks
        visible: logic.progress != 100,
        child: Container(
            child: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.orange),
          value: logic.progress.value / 100.0,
        )));
  }

  Widget _buildWebViewAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(title),
    );
  }

  Widget _buildWebViewWidget() {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onProgress: (progress) {
        logic.updateProgress(progress);
        print("WebView is loading (progress : $progress%)");
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }
}
