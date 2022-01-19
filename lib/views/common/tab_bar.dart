import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/zkfly.dart';

class TabBarTab extends ZkGetxPageTabBar<FlyBeeFilter>
    implements PreferredSizeWidget {
  final int tabLength;
  final int tabInitialIndex;
  TabBarTab({Key? key, required this.tabLength, required this.tabInitialIndex})
      : super(key: key, length: tabLength, initialIndex: tabInitialIndex);

  @override
  List<Widget> tabBars(BuildContext context, int index) {
    return controller.widgetListOf(zkValueKey) ?? [];
  }

  @override
  Size get preferredSize => controller.tabbarSize;
}

class MainPageView extends ZkGetxPageView<FlyBeeFilter> {
  MainPageView() : super(key: FlybeeKey.keyMainPage, itemCount: 4);
  @override
  @protected
  Widget buildPage(BuildContext context, int page) {
    return controller.widgetListOf(FlybeeKey.keyMainPage)![page];
  }
}
