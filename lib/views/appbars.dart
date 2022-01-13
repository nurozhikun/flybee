import 'package:flutter/material.dart';
import 'package:zkfly/appviews/index.dart';
import 'package:zkfly/zkfly.dart';
import '../filters/index.dart';

class BeeAppBar extends ZkGetfindView<FlyBeeFilter>
    implements PreferredSizeWidget {
  BeeAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => controller.appbarSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(controller.labelTextOf(zkValueKey) ?? "appbar"),
        centerTitle: true,
        leading: _buildLeading(),
        actions: _buildAction(context));
  }

// 设置_模式
  Widget? _buildLeading() {
    return (zkValueKey!.value == 'home_appbar')
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
                    child: Image(
                        image: AssetImage('assets/images/monitor_noc.jpg')),
                  ),
                ),
              ),
              const Text('监控模式', style: TextStyle(fontSize: 10)),
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
      IconButton(
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
    ];
  }
}
