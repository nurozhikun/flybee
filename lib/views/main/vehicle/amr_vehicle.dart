import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:get/get.dart';

import '../../index.dart';

class AmrVehicle extends ZkGetfindView<FlyBeeFilter> {
  AmrVehicle({Key? key = FlybeeKey.beeKeyAmrVehicle}) : super(key: key);

  // 控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  final List<Map> dataListCopy = [
    {'id': 1, 'lifeCycle': 1},
    {'id': 2, 'lifeCycle': 2},
    {'id': 3, 'lifeCycle': 3},
    {'id': 4, 'lifeCycle': 4},
  ];
  @override
  Widget build(BuildContext context) {
    return SmartRefreshView(
      controller: refreshController,
      titleList: const ['编号', '状态', '位置'],
      buildDataItem: (index) {
        return _buildDataItem(dataListCopy[index]);
      },
    );
  }
}

// 内容
Widget _buildDataItem(data) {
  return Column(
    children: [
      Row(
        children: [
          // 编号
          BuildExpandedCell(
            text: data['id'].toString(),
            textColor: Get.theme.primaryColor,
            onTap: () {},
          ),
          // 状态
          BuildExpandedCell(
            containerColor: Get.theme.primaryColor,
            text: data['lifeCycle'].toString(),
            textColor: Colors.white,
          ),
          // 下发时间
          const BuildExpandedCell(
            text: '平面储存区',
          ),
        ],
      ),
      // 进度条
    ],
  );
}
