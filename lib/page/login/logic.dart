import 'package:flutter/material.dart';
import 'package:flutter_wan_android/http/http_util.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {
  login(String userName, String password) {
    HttpUtil.getInstance().post(
        "/user/login", {"username": userName, "password": password},
        onSuccess: (data) {}, onError: (error) {
      print(error);
      Get.snackbar("温馨提示", error,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    });
  }
}
