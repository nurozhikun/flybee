import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/appviews/index.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:zkfly/zkfly.dart';

class MainServer extends ZkGetfindView<FlyBeeFilter> {
  MainServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ZkServerForm(
        key: ZkValueKey.keyMainServer,
        filter: controller,
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('设备号'), Text(ZkGetxPlatform.to.identifier.value)],
        ),
      )
    ]);
  }
}
