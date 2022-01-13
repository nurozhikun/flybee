import 'package:flutter/material.dart';
import 'package:flybee/views/user_drawer.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import '../filters/flybee_filter.dart';
import '../views/appbars.dart';

class MainRoute extends ZkGetputView<FlyBeeFilter> {
  MainRoute({Key? key = ZkValueKey.keyHomeRoute})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );
  @override
  Widget build(BuildContext context) {
    // print("build widget of MainRoute");
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: BeeAppBar(
          key: ZkValueKey.keyHomeAppbar,
        ),
        body: MainPageView(),
        bottomNavigationBar: MainPageNaviBar(),
        endDrawer: UserDrawer(),
        //bottomNavigationBar: Obx(() => MainPageNaviBar()),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return true;
  }
}

class MainPageView extends ZkGetxPageView<FlyBeeFilter> {
  MainPageView() : super(key: const ZkValueKey("main_page"));
  @override
  @protected
  Widget buildPage(BuildContext context, int page) {
    // print("screen width:${ZkShared.screenPixelWidth}");
    return Text("show message ... $page");
    // if (0 == page) {
    //   // return AmrMonitor();
    // } else if (1 == page) {
    //   return AmrTask();
    // } else {
    //   return Text("show message ... $page");
    // }
  }
}

class MainPageNaviBar extends ZkGetxPageNavigationBar<FlyBeeFilter> {
  MainPageNaviBar() : super(key: const ZkValueKey("main_page"));
  @override
  List<BottomNavigationBarItem> bottomBars(BuildContext context, int index) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.place),
        label: "monitor".tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.playlist_play),
        label: "task".tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        label: "vehicle".tr,
      ),
    ];
  }
}
