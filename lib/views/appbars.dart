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
        // leading: Text(code),
        leading: Column(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ZkIconButton(
                key: key,
                filter: controller,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
                icon: const ClipOval(
                  child:
                      Image(image: AssetImage('assets/images/monitor_noc.jpg')),
                ),
              ),
            ),
            const Text('监控模式', style: TextStyle(fontSize: 10)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            tooltip: 'user',
            iconSize: 20,
            splashRadius: 20,
            onPressed: () {},
          )
        ]);
  }
}
