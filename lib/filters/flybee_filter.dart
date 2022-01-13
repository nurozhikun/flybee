import 'package:flutter/material.dart';
import 'package:flybee/routes/login_route.dart';
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
    return beeMap[key!.value] == null ? null : beeMap[key.value]![0];
    // return prefixIconMap[key!.value];
  }

  @override
  void onPressed(ZkValueKey? key) {
    beeMap[key!.value] == null ? null : beeMap[key.value]![1]!();
    super.onPressed(key);
  }
}

Map<String, List> beeMap = {
  "btn_monitor": ['', () {}],
  "btn_logout": [mapIcon(Icons.power_settings_new), () {}],
  "btn_login": [mapIcon(Icons.login), () => Get.to(() => LoginRoute())],
  "btn_fix_password": [mapIcon(Icons.lock), () {}],
  "btn_user_admin": [mapIcon(Icons.person_add), () {}],
  "btn_device_admin": [mapIcon(Icons.devices_rounded), () {}],
  "btn_locator_admin": [mapIcon(Icons.category), () {}],
  "btn_back": [mapIcon(Icons.arrow_back, size: 24), () => Get.back()]
};

// // onPressed
// Map<String, Function()> onPressedMap = {
//   "btn_monitor": () {},
//   "btn_logout": () {
//     print('*******************************');
//   },
//   "btn_login": () => Get.to(() => LoginRoute()),
//   "btn_fix_password": () {},
//   "btn_user_admin": () {},
//   "btn_device_admin": () {},
//   "btn_locator_admin": () {},
//   "btn_back": () => Get.back()
// };

// // prefixIconOf
// Map<String, Icon> prefixIconMap = {
//   "btn_logout": mapIcon(Icons.power_settings_new),
//   "btn_login": mapIcon(Icons.login),
//   "btn_fix_password": mapIcon(Icons.lock),
//   "btn_user_admin": mapIcon(Icons.person_add),
//   "btn_device_admin": mapIcon(Icons.devices_rounded),
//   "btn_locator_admin": mapIcon(Icons.category),
//   "btn_back": mapIcon(Icons.arrow_back, size: 24),
// };

Icon mapIcon(IconData icon, {double? size}) {
  return Icon(
    icon,
    size: size ?? 16,
    color: Colors.white,
  );
}
