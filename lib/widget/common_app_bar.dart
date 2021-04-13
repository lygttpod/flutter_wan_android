import 'package:flutter/material.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

AppBar commonAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () => Get.toNamed(AppRoutes.searchPage))
    ],
  );
}
