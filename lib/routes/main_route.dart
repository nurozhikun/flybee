import 'package:flutter/material.dart';
import 'package:flybee/views/user_drawer.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import '../filters/flybee_filter.dart';
import '../views/appbars.dart';

class MainRoute extends ZkGetputView<FlyBeeFilter> {
  MainRoute({Key? key})
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
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.place),
        label: "monitor",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.playlist_play),
        label: "task",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "vehicle",
      ),
    ];
  }
}
