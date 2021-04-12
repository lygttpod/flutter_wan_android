import 'package:flutter_wan_android/config/page_status.dart';
import 'package:get/get.dart';

abstract class BaseGetxController extends GetxController{
  var pageStatus = PageStatus.LOADING.obs;

  void updatePageStatus(PageStatus status) {
    pageStatus.value = status;
  }
}