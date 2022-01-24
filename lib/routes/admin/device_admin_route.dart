import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zkfly/getxapp/index.dart';

class DeviceAdminRoute extends ZkGetputView<FlyBeeFilter> {
  DeviceAdminRoute({Key? key = FlybeeKey.beeKeyDeviceAdmin})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );
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
    return Scaffold(
      endDrawer: UserDrawer(),
      appBar: BeeAppBar(
        key: key,
      ),
      body: SmartRefreshView(
        controller: refreshController,
        titleList: const ['编号', '状态', '库区'],
        buildDataItem: (index) {
          return _buildDataItem(dataListCopy[index], context);
        },
      ),
    );
  }
}

// 内容
Widget _buildDataItem(data, context) {
  return Column(
    children: [
      Row(
        children: [
          // 用户名
          BuildExpandedCell(
            text: data['id'].toString(),
            textColor: Theme.of(context).primaryColor,
            onTap: () {},
          ),
          // 状态
          BuildExpandedCell(
            containerColor: Theme.of(context).primaryColor,
            text: data['lifeCycle'].toString(),
            textColor: Colors.white,
          ),
          // 手机号
          const BuildExpandedCell(
            text: 'A',
          ),
        ],
      ),
      // 进度条
    ],
  );
}
