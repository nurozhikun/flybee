import 'package:flutter/material.dart';
import 'package:flybee/routes/index.dart';
import 'package:flybee/views/index.dart';
import 'package:flybee/views/settings/index.dart';
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
  Size get appbarSize => const Size.fromHeight(60.0);
  Size get setAppBarSize => const Size.fromHeight(100.0);
  Size get tabbarSize => const Size.fromHeight(40.0);
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
    // 跳转到设置页
    insertOnPressed(FlybeeKey.beeKeyBtnMonitor, () => Get.to(SettingsRoute()));

    // 用户
    insertOnPressed(FlybeeKey.beeKeyBtnUser, () {});

    // 退出登录
    insertOnPressed(FlybeeKey.beeKeyBtnLogout, () {});

    // 跳转到登录
    insertOnPressed(FlybeeKey.beeKeyBtnLogin, () {
      Get.back();
      Get.to(LoginRoute());
    });

    // 修改密码
    insertOnPressed(FlybeeKey.beeKeyBtnFixPassword, (params) {});

    // 返回
    insertOnPressed(FlybeeKey.beeKeyBtnBack, () => Get.back());

    // 用户管理
    insertOnPressed(FlybeeKey.beeKeyUserAdmin, () {});

    // 设备管理
    insertOnPressed(FlybeeKey.beeKeyDeviceAdmin, () {});

    // 库位管理
    insertOnPressed(FlybeeKey.beeKeyLocatorAdmin, () {});
  }

  // navigationPage
  void _navigationPage() {
    // bottomNavigation
    insertWidgetListBuilder(ZkValueKey.keyMainPage,
        () => [AmrHome(), AmrMonitor(), AmrTask(), AmrVehicle()]);
    // settingTab
    insertWidgetListBuilder(ZkValueKey.keySettingsTap,
        () => tabData.map((e) => mapTab(e)).toList());
    // settingTabPage
    insertWidgetListBuilder(ZkValueKey.keySettingsTapPage,
        () => [MainServer(), AreaServer(), GeneralSet()]);
  }

  // void _themeBuild() {
  //   insertThemeBuilder(
  //       ZkValueKey.keyThemeTeal,
  //       () => ThemeData(
  //             primarySwatch: Colors.teal,
  //           ));
  //   insertThemeBuilder(
  //       ZkValueKey.keyThemeIndigo,
  //       () => ThemeData(
  //             primarySwatch: Colors.indigo,
  //           ));
  //   insertThemeBuilder(
  //       ZkValueKey.keyThemePink,
  //       () => ThemeData(
  //             primarySwatch: Colors.pink,
  //           ));
  // }
}
