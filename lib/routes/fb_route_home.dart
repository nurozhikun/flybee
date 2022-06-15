import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
// import 'package:flybee/views/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import 'package:zkfly_ims/zkfly_ims.dart';
import 'index.dart';

mixin FbRouteHomeFilter {
  static final homePageBarLabels = <String>[
    "region",
    "task",
    "vehicle",
    "custom",
  ];
  static var floors = <String>[
    "floor1",
    "floor2",
    "floor3",
    "floor4",
  ];
  RxInt currentFloor = 0.obs;
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
        .homePageBarLabels[controller.homePageCtrl.currentPage.value].tr));
    // return Text("task".tr);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    var ls = <Widget>[
      Obx(
        () => DropdownButton<String>(
          value: FbRouteHomeFilter.floors[controller.currentFloor.value],
          onChanged: (String? newValue) {
            controller.currentFloor.value =
                FbRouteHomeFilter.floors.indexOf(newValue!);
          },
          icon: const Icon(Icons.arrow_downward, size: 18),
          items: FbRouteHomeFilter.floors
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value.tr),
            );
          }).toList(),
          underline: Container(height: 2, color: Colors.deepPurpleAccent),
          style: const TextStyle(fontSize: 14, color: Colors.black),
          // itemHeight: null,
        ),
      ),
    ];
    ls = ls + super.buildActions(context);
    return ls;
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
    if (2 == page) {
      return FbViewByFloor();
    } else {
      return Text("View$page");
    }
  }
}

class _FbHomePageBottomBar extends GetzkPageBottomNavigationBar {
  const _FbHomePageBottomBar(GetzkPageController ctrl) : super(pageCtrl: ctrl);
  @override
  List<BottomNavigationBarItem> barItems(BuildContext context, int index) {
    // FbRouteHomeFilter.homePageBarLabels.map<BottomNavigationBarItem>((e) {
    //   return BottomNavigationBarItem()
    // });
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        label: FbRouteHomeFilter.homePageBarLabels[0].tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.place),
        label: FbRouteHomeFilter.homePageBarLabels[1].tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.playlist_play),
        label: FbRouteHomeFilter.homePageBarLabels[2].tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.settings),
        label: FbRouteHomeFilter.homePageBarLabels[3].tr,
      ),
    ];
  }
}

class _FbHomeViewRegions {}

class _FbHomeViewTasks {}

class _FbHomeViewDevices {}
