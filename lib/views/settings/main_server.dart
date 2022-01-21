import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/zkfly.dart';

import '../index.dart';

class MainServer extends ZkGetfindView<FlyBeeFilter> {
  MainServer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ServerForm(
          key: FlybeeKey.beeKeyMainServer,
          filter: controller,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.labelTextOf(FlybeeKey.beeKeyDeviceSn) ?? ''),
              FutureBuilder<String>(
                future: initPlatformState(),
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data == null ? "" : snapshot.data!);
                  } else {
                    return const Text("is loading");
                  }
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
