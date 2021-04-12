import 'package:flutter_wan_android/base/base_getx_controller.dart';
import 'package:get/get.dart';

class WebViewLogic extends BaseGetxController {
  var progress = 0.obs;

  updateProgress(int progress) {
    this.progress.value = progress;
  }
}
