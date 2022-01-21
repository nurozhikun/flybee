import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/index.dart';
import 'package:zkfly/getxapp/index.dart';

class SettingsRoute extends ZkGetputView<FlyBeeFilter> {
  SettingsRoute({Key? key = FlybeeKey.beeKeySettings})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );

  @override
  Widget build(BuildContext context) {
    controller.onPressed(FlybeeKey.beeKeySetProgress);
    return Scaffold(
      endDrawer: UserDrawer(),
      appBar: BeeAppBar(
        key: key,
      ),
      body: TabBarView(
        children:
            controller.widgetListOf(FlybeeKey.beeKeySettingsTapPage) ?? [],
        controller: controller.tabControllerOf(FlybeeKey.beeKeySettingsTap,
            vsync: controller),
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
