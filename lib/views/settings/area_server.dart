import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/common/index.dart';
import 'package:zkfly/zkfly.dart';

class AreaServer extends ZkGetfindView<FlyBeeFilter> {
  AreaServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ServerForm(
          key: FlybeeKey.keyAreaServer,
          filter: controller,
        ),
        const Divider(),
        Column(
          children: const [
            ListTile(
              title: Text('盛达'),
              subtitle: Text('192.168.110.226:8001'),
            ),
            ListTile(
              title: Text('新昌'),
              subtitle: Text('192.168.110.226:8002'),
            ),
          ],
        )
      ]),
    );
  }
}
