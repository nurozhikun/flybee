import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/common/chart/index.dart';
import 'package:zkfly/getxapp/index.dart';

import 'monitor_card.dart';

class AmrHome extends ZkGetfindView<FlyBeeFilter> {
  AmrHome({Key? key = FlybeeKey.beeKeyAmrHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List itemsTask = [
      {'title': controller.labelTextOf(FlybeeKey.beeKeyIssue), 'count': '48'},
      {
        'title': controller.labelTextOf(FlybeeKey.beeKeyCompleted),
        'count': '8'
      },
      {'title': controller.labelTextOf(FlybeeKey.beeKeyTodo), 'count': '38'},
    ];
    final List itemsAlarm = [
      {'title': controller.labelTextOf(FlybeeKey.beeKeyAmrTask), 'count': '20'},
      {
        'title': controller.labelTextOf(FlybeeKey.beeKeyAmrVehicle),
        'count': '30'
      },
      {'title': controller.labelTextOf(FlybeeKey.beeKeyPoint), 'count': '60'},
    ];
    // 告警
    final List alarmData = [
      {'xAxis': 0, 'yAxis': 20.0},
      {'xAxis': 1, 'yAxis': 30.0},
      {'xAxis': 2, 'yAxis': 60.0},
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          MonitorCard(
            items: itemsTask,
            title: controller.labelTextOf(FlybeeKey.beeKeyTaskToday) ?? '',
          ),
          MonitorCard(
            items: itemsAlarm,
            title: controller.labelTextOf(FlybeeKey.beeKeyAlarm) ?? '',
          ),
          BarChartAlarm(
            data: alarmData,
            controller: controller,
          )
        ],
      ),
    );
  }
}
