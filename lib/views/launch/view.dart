import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sienect/common/index.dart';

import 'controller.dart';

class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LaunchController>(
        init: LaunchController(),
        builder: (C) => Scaffold(
              body: Center(
                child: Text(C.seconds.value.toString()),
              ),
            ));
  }
}
