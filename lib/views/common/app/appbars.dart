import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/zkfly.dart';
import 'package:get/get.dart';

import '../../index.dart';

class BeeAppBar extends ZkGetfindView<FlyBeeFilter>
    implements PreferredSizeWidget {
  BeeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => (zkValueKey == FlybeeKey.beeKeySettings)
      ? controller.setAppBarSize
      : controller.appbarSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (zkValueKey == FlybeeKey.keyMainPage)
          ? Obx(() => Text(controller
              .labelTextOf(controller
                  .widgetListOf(zkValueKey)![controller
                          .pageControllerOf(zkValueKey)
                          ?.currentPage
                          .value ??
                      0]
                  .key as ZkValueKey)
              .toString()))
          : Text(controller.labelTextOf(zkValueKey) ?? 'appBar'),
      centerTitle: true,
      leading: _buildLeading(),
      actions: _buildAction(context),
      bottom: (zkValueKey == FlybeeKey.beeKeySettings)
          ? TabBarTab(
              key: FlybeeKey.beeKeySettingsTap,
              tabInitialIndex: 0,
              tabLength: 3,
            )
          : null,
    );
  }

// 设置_模式
  Widget? _buildLeading() {
    return (zkValueKey == FlybeeKey.keyMainPage)
        ? Column(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ZkIconButton(
                  key: FlybeeKey.beeKeyBtnMonitor,
                  filter: controller,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                  icon: const ClipOval(
                    child:
                        Image(image: AssetImage('assets/images/monitor.jpg')),
                  ),
                ),
              ),
              Text(
                  controller.labelTextOf(FlybeeKey.beeKeyAmrMonitor) ??
                      FlybeeKey.beeKeyAmrMonitor.value,
                  style: const TextStyle(fontSize: 10)),
            ],
          )
        : IconButton(
            onPressed: () => controller.onPressed(FlybeeKey.beeKeyBtnBack),
            icon: controller.prefixIconOf(FlybeeKey.beeKeyBtnBack)!,
          );
  }

// action
  List<Widget> _buildAction(context) {
    return [
      Container(
        width: 60,
        margin: const EdgeInsets.only(top: 4),
        child: IconButton(
          icon: Column(children: const [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Text('admin', style: TextStyle(fontSize: 10))
          ]),
          iconSize: 24,
          splashRadius: 20,
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ),
    ];
  }
}
