import 'dart:async';

import 'package:get/get.dart';
import 'package:sienect/common/utiles/index.dart';
import 'package:sienect/routes/app_pages.dart';

class LaunchController extends GetxController {
  /// ''''''''''''''状态'''''''''''''''
  // 倒计时
  RxInt seconds = 5.obs;

  // 定时器
  late final _seTimer;

  /// ''''''''''''''方法'''''''''''''''

  /// ''''''''''''''生命周期'''''''''''''''
  @override
  void onInit() {
    _seTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value -= 1;
      } else {
        Get.toNamed(Routes.home);
      }
      update();
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cancelTimer(_seTimer);
    super.onClose();
  }
}
