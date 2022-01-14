import 'package:flutter/material.dart';
import 'package:flybee/routes/login_route.dart';
import 'package:flybee/views/index.dart';
import 'package:zkfly/zkfly.dart';
import 'package:get/get.dart';
import 'flybee_key.dart';

class FlyBeeFilter extends ZkGetxFilter {
  // static FlyBeeFilter get to => Get.find();
  FlyBeeFilter() {
    _iconBuild();
    _onPressed();
    _navigationPage();
  }
  Size get appbarSize => const Size.fromHeight(64.0);
  // String get appbarTitle {
  //   // return "flybee application";
  //   return "appbar_title".tr;
  // }
  // String titleOf(String obj) {
  //   var s = obj + "_title";
  //   return s.tr;
  // }

  // @override
  // String? labelTextOf(ZkValueKey? key) {
  //   return key?.value.tr;
  // }

  // @override
  // Icon? prefixIconOf(ZkValueKey? key) {
  //   return (null == key)
  //       ? null
  //       : beeMap[key.value]?[0] ?? super.prefixIconOf(key);
  // }

  // @override
  // void onPressed(ZkValueKey? key) {
  //   beeMap[key!.value] == null ? null : beeMap[key.value]![1]!();
  //   super.onPressed(key);
  // }

// iconBuild
  void _iconBuild() {
    insertPrefixIconBuilder(FlybeeKey.beeKeyBtnMonitor, () => null);
    insertPrefixIconBuilder(FlybeeKey.beeKeyBtnUser, () => null);
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyBtnLogout, () => mapIcon(Icons.power_settings_new));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyBtnLogin, () => mapIcon(Icons.login));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyBtnFixPassword, () => mapIcon(Icons.lock));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyBtnBack, () => mapIcon(Icons.arrow_back));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyUserAdmin, () => mapIcon(Icons.person_add));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyDeviceAdmin, () => mapIcon(Icons.devices_rounded));
    insertPrefixIconBuilder(
        FlybeeKey.beeKeyLocatorAdmin, () => mapIcon(Icons.category));
  }

// onPressed
  void _onPressed() {
    insertOnPressed(FlybeeKey.beeKeyBtnMonitor, () {});
    insertOnPressed(FlybeeKey.beeKeyBtnUser, () {});
    insertOnPressed(FlybeeKey.beeKeyBtnLogout, () {});
    insertOnPressed(FlybeeKey.beeKeyBtnLogin, () {
      Get.back();
      Get.to(() => LoginRoute());
    });
    insertOnPressed(FlybeeKey.beeKeyBtnFixPassword, () {});
    insertOnPressed(FlybeeKey.beeKeyBtnBack, () => Get.back());
    insertOnPressed(FlybeeKey.beeKeyUserAdmin, () {});
    insertOnPressed(FlybeeKey.beeKeyDeviceAdmin, () {});
    insertOnPressed(FlybeeKey.beeKeyLocatorAdmin, () {});
  }

  // navigationPage
  void _navigationPage() {
    insertNavigationPageBuilder(ZkValueKey.keyMainPage,
        () => [AmrHome(), AmrMonitor(), AmrTask(), AmrVehicle()]);
  }
}

Icon mapIcon(IconData icon, {double? size}) {
  return Icon(
    icon,
    size: size ?? 16,
    color: Colors.white,
  );
}
