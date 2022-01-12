import 'package:flutter/material.dart';
import 'package:zkfly/zkfly.dart';
import '../filters/flybee_filter.dart';

class BeeAppBar extends ZkGetfindView<FlyBeeFilter>
    implements PreferredSizeWidget {
  BeeAppBar({Key? key, this.actions}) : super(key: key);
  final List<Widget>? actions;
  @override
  Size get preferredSize => controller.appbarSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(controller.labelTextOf(zkValueKey) ?? "appbar"),
        centerTitle: true,
        // leading: Text(code),
        leading: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/monitor_noc.jpg')),
              ),
              SizedBox(
                height: 2,
              ),
              Text('监控模式', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
        actions: actions);
  }
}
