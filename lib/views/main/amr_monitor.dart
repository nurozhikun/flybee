import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/getxapp/index.dart';

class AmrMonitor extends ZkGetfindView<FlyBeeFilter> {
  AmrMonitor({Key? key = FlybeeKey.beeKeyAmrMonitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('AmrMonitor');
  }
}
