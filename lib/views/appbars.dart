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
        title: Text(controller.titleOf("appbar")),
        // leading: Text(code),
        leading: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.home),
        ),
        actions: actions);
  }
}
