import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/common/chart/index.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:get/get.dart';

import 'monitor_card.dart';

class AmrHome extends ZkGetfindView<FlyBeeFilter> {
  AmrHome({Key? key = FlybeeKey.beeKeyAmrHome}) : super(key: key);
  final List itemsTask = [
    {'title': '下发', 'count': '48'},
    {'title': '已完成', 'count': '8'},
    {'title': '待完成', 'count': '38'},
  ];
  final List itemsAlarm = [
    {'title': '任务', 'count': '20'},
    {'title': '设备', 'count': '30'},
    {'title': '库位', 'count': '60'},
  ];
  // 告警
  final List alarmData = [
    {'xAxis': 0, 'yAxis': 20.0},
    {'xAxis': 1, 'yAxis': 30.0},
    {'xAxis': 2, 'yAxis': 60.0},
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MonitorCard(
            items: itemsTask,
            title: '今日任务',
          ),
          MonitorCard(
            items: itemsAlarm,
            title: '告警',
          ),
          BarChartAlarm(
            data: alarmData,
          )
        ],
      ),
    );
  }
}
