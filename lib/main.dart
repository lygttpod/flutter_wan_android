import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wan_android/page/main/view.dart';
import 'package:flutter_wan_android/router/router_pages.dart';
import 'package:get/get.dart';

void main() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RouterPages.pages,
      title: "玩Android",
      theme: ThemeData(primaryColor: Colors.blue),
      home: MainPage(),
    );
  }
}
