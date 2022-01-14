import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/index.dart';
import 'package:zkfly/app/index.dart';
import 'package:zkfly/getxapp/index.dart';

class SettingsRoute extends ZkGetputView<FlyBeeFilter> {
  SettingsRoute({Key? key = ZkValueKey.keySettings})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserDrawer(),
      appBar: BeeAppBar(
        key: key,
      ),
      body: TabBarView(
        children: controller.widgetListOf(ZkValueKey.keySettingsTapPage) ?? [],
        controller: controller.tabControllerOf(ZkValueKey.keySettingsTap,
            vsync: controller),
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
