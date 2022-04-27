import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
// import 'package:flybee/views/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import 'package:zkfly_ims/zkfly_ims.dart';

mixin FbRouteHomeFilter {
  static final homePageBarLabels = <String>[
    "region",
    "task",
    "vehicle",
    "custom",
  ];
  GetzkPageController? _homePageCtrl;
  GetzkPageController get homePageCtrl {
    _homePageCtrl ??= GetzkPageController(
      initialPage: 1,
      onPageChanged: onHomePageChanged,
    );
    return _homePageCtrl!;
  }

  void onHomePageChanged(int oldPage, int newPage) {
    print("page$oldPage to page$newPage");
  }
}

class FbRouteHome extends ZkGetputView<FlyBeeFilter> {
  FbRouteHome()
      : super(
          key: ZkValueKey.keyHomeRoute,
          filter: FlyBeeFilter(),
        );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: _FbHomeAppBar(),
        body: _FbHomePageView(controller.homePageCtrl),
        bottomNavigationBar: _FbHomePageBottomBar(controller.homePageCtrl),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return true;
  }
}

class _FbHomeAppBar extends ImsBeeAppBarMain<FlyBeeFilter> {
  _FbHomeAppBar() : super(key: FlybeeKey.beeKeyAppBarMain);
  @override
  Widget buildTitle() {
    return Obx(() => Text(FbRouteHomeFilter
        .homePageBarLabels[controller.homePageCtrl.currentPage.value]));
    // return Text("task".tr);
  }
}

class _FbHomePageView extends GetzkPageView {
  _FbHomePageView(GetzkPageController ctrl)
      : super(
          pageCtrl: ctrl,
          itemCount: FbRouteHomeFilter.homePageBarLabels.length,
        );
  @protected
  Widget buildPage(BuildContext context, int page) {
    return Text("View$page");
  }
}

class _FbHomePageBottomBar extends GetzkPageBottomNavigationBar {
  _FbHomePageBottomBar(GetzkPageController ctrl) : super(pageCtrl: ctrl);
  @override
  List<BottomNavigationBarItem> barItems(BuildContext context, int index) {
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

class _FbHomeViewRegions {}

class _FbHomeViewTasks {}

class _FbHomeViewDevices {}
