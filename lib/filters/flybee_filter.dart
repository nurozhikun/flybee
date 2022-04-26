import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/routes/index.dart';
import 'package:flybee/views/index.dart';
import 'package:flybee/views/settings/index.dart';
import 'package:zkfly/zkfly.dart';
import 'package:get/get.dart';
import 'package:zkfly_ims/bee/index.dart';
import 'flybee_key.dart';

class FlyBeeFilter extends ImsBeeFilter {
  static FlyBeeFilter get to => Get.find();
  FlyBeeFilter() {
    _iconBuild();
    _onPressed();
    _navigationPage();
  }
  Size get appbarSize => const Size.fromHeight(60.0);
  Size get setAppBarSize => const Size.fromHeight(100.0);
  Size get tabbarSize => const Size.fromHeight(40.0);
  // 设置的进度
  RxInt setProgress = 0.obs;

  // tabController
  FlyBeeTabController? tabControllerOf(ZkValueKey? key,
      {int length = 3, int initialIndex = 0, required TickerProvider vsync}) {
    var c = controllers.putIfAbsent(
      key,
      () => FlyBeeTabController(
          length: length, initialIndex: initialIndex, vsync: vsync),
    );
    return c;
  }

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
  // navigationPage
  void _navigationPage() {
    // bottomNavigation
    insertWidgetListBuilder(FlybeeKey.keyMainPage,
        () => [AmrHome(), AmrMonitor(), AmrTask(), AmrVehicle()]);
    // settingTab
    insertWidgetListBuilder(
        FlybeeKey.beeKeySettingsTap,
        () => [
              labelTextOf(FlybeeKey.beeKeyMainServer),
              labelTextOf(FlybeeKey.beeKeyAreaServer),
              labelTextOf(FlybeeKey.beeKeyGeneralSet)
            ].asMap().entries.map((e) => mapTab(e)).toList());
    // settingTabPage
    insertWidgetListBuilder(FlybeeKey.beeKeySettingsTapPage,
        () => [MainServer(), AreaServer(), GeneralSet()]);
  }

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
        FlybeeKey.beeKeyPointAdmin, () => mapIcon(Icons.category));
  }

// onPressed
  void _onPressed() {
    // 跳转到设置页
    insertOnPressed(
        FlybeeKey.beeKeyBtnMonitor, () => Get.to(() => SettingsRoute()));
    // 用户
    insertOnPressed(FlybeeKey.beeKeyBtnUser, () {});
    // // 登录
    // insertOnPressed(ZkValueKey.keyLogin, (String userName, String pass) {
    //   print(userName);
    //   print(actionOf(ZkValueKey.keyLogin));
    // });

    // 退出登录
    insertOnPressed(FlybeeKey.beeKeyBtnLogout, () {});

    // 跳转到登录
    insertOnPressed(FlybeeKey.beeKeyBtnLogin, () {
      Get.back();
      Get.to(() => LoginRoute(
            key: ZkValueKey.keyLogin,
          ));
    });

    // 修改密码
    insertOnPressed(FlybeeKey.beeKeyBtnFixPassword, () {
      Get.back();
      Get.to(() => LoginRoute(
            key: FlybeeKey.beeKeyBtnFixPassword,
          ));
    });

    // 返回
    insertOnPressed(FlybeeKey.beeKeyBtnBack, () => Get.back());

    // 取消
    insertOnPressed(
        FlybeeKey.beeKeyBtnCancel, () => Get.back(result: 'cancel'));

    // 确认
    insertOnPressed(
        FlybeeKey.beeKeyBtnConfirm, (String value) => Get.back(result: value));

    // 用户管理
    insertOnPressed(FlybeeKey.beeKeyUserAdmin, () {
      Get.back();
      Get.to(() => UserAdminRoute());
    });

    // 设备管理
    insertOnPressed(FlybeeKey.beeKeyDeviceAdmin, () {
      Get.back();
      Get.to(() => DeviceAdminRoute());
    });

    // 库位管理
    insertOnPressed(FlybeeKey.beeKeyPointAdmin, () {
      Get.back();
      Get.to(() => PointAdminRoute());
    });

    // 服务器测试
    insertOnPressed(FlybeeKey.beeKeyTest,
        (String ip, String port, FlybeeKey key, ZkFilter filter) async {
      if (key == FlybeeKey.beeKeyMainServer) {
        var res = await scaleDialogView(
            CommandKey(
              filter: filter,
            ),
            title: 'commandKey');
        ZkGetxStorage.to.setInt(FlybeeKey.beeKeySetProgress.value, 0);
        onPressed(FlybeeKey.beeKeySetProgress);
        return res;
      } else if (key == FlybeeKey.beeKeyAreaServer) {
        print(ip + ':' + port);
      }
    });

    // 服务器保存
    insertOnPressed(FlybeeKey.beeKeySave,
        (String ip, String port, FlybeeKey key, ZkFilter filter) {
      if (key == FlybeeKey.beeKeyMainServer) {
        print(ip + ':' + port);
      } else if (key == FlybeeKey.beeKeyAreaServer) {
        print(ip + ':' + port);
      }
    });

    // 设置进度
    insertOnPressed(FlybeeKey.beeKeySetProgress, () {
      // 还需考虑用户是否登录
      // String mainServer =
      //     ZkGetxStorage.to.getString(FlybeeKey.beeKeyMainServer.value);
      // String areaServer =
      //     ZkGetxStorage.to.getString(FlybeeKey.beeKeyAreaServer.value);
      // if (mainServer.isEmpty) {
      //   setProgress.value = 0;
      // } else if (mainServer.isNotEmpty && areaServer.isEmpty) {
      //   setProgress.value = 1;
      // } else {
      //   setProgress.value = 2;
      // }
      setProgress.value =
          ZkGetxStorage.to.getInt(FlybeeKey.beeKeySetProgress.value);
    });
  }
}
