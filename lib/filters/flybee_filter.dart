import 'package:flutter/material.dart';
import 'package:flybee/views/login.dart';
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
  // String titleOf(String obj) {
  //   var s = obj + "_title";
  //   return s.tr;
  // }

  @override
  String? labelTextOf(ZkValueKey? key) {
    return key?.value.tr;
  }

  @override
  Icon? prefixIconOf(ZkValueKey? key) {
    return prefixIconMap[key!.value];
  }

  @override
  void onPressed(ZkValueKey? key) {
    onPressedMap[key!.value]!();
    super.onPressed(key);
  }
}

// onPressed
Map<String, Function()> onPressedMap = {
  "btn_logout": () {
    print('*******************************');
  },
  "btn_login": () => Get.to(() => Login()),
  "btn_fix_password": () {},
  "btn_user_admin": () {},
  "btn_device_admin": () {},
  "btn_locator_admin": () {},
};

// prefixIconOf
Map<String, Icon> prefixIconMap = {
  "btn_logout": mapIcon(Icons.power_settings_new),
  "btn_login": mapIcon(Icons.login),
  "btn_fix_password": mapIcon(Icons.lock),
  "btn_user_admin": mapIcon(Icons.person_add),
  "btn_device_admin": mapIcon(Icons.devices_rounded),
  "btn_locator_admin": mapIcon(Icons.category),
};

Icon mapIcon(IconData icon) {
  return Icon(
    icon,
    size: 16,
    color: Colors.white,
  );
}
