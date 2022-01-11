import 'package:flutter/material.dart';
import 'package:zkfly/zkfly.dart';
import 'package:get/get.dart';

class FlyBeeFilter extends ZkGetxFilter {
  // static FlyBeeFilter get to => Get.find();
  FlyBeeFilter();
  Size get appbarSize => const Size.fromHeight(64.0);
  // String get appbarTitle {
  //   // return "flybee application";
  //   return "appbar_title".tr;
  // }
  String titleOf(String obj) {
    var s = obj + "_title";
    return s.tr;
  }

  @override
  void onPressed(ZkValueKey? key) {
    super.onPressed(key);
  }
}
