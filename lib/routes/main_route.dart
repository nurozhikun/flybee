import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/index.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';

class MainRoute extends ZkGetputView<FlyBeeFilter> {
  MainRoute({Key? key = ZkValueKey.keyHomeRoute})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: BeeAppBar(
          key: FlybeeKey.keyMainPage,
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
  MainPageView() : super(key: FlybeeKey.keyMainPage, itemCount: 4);
  @override
  @protected
  Widget buildPage(BuildContext context, int page) {
    return controller.widgetListOf(FlybeeKey.keyMainPage)![page];
  }
}

class MainPageNaviBar extends ZkGetxPageNavigationBar<FlyBeeFilter> {
  MainPageNaviBar() : super(key: FlybeeKey.keyMainPage);
  @override
  List<BottomNavigationBarItem> bottomBars(BuildContext context, int index) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: "home".tr,
      ),
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
