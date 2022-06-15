import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import 'package:zkfly_ims/zkfly_ims.dart';

class FbViewByFloor extends ZkGetfindView<FlyBeeFilter> {
  FbViewByFloor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Obx(() => ListView());
    return ListView(
      children: [
        Text("floor one"),
        Column(
          children: const [
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
            Text("column 1"),
          ],
        ),
        Text("floor two"),
        Text("floor three"),
        Text("floor four"),
      ],
    );
  }
}
