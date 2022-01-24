import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/index.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zkfly/getxapp/index.dart';

class UserAdminRoute extends ZkGetputView<FlyBeeFilter> {
  UserAdminRoute({Key? key = FlybeeKey.beeKeyUserAdmin})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );
  // 控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  final List<Map> dataListCopy = [
    {'user': 'admin', 'lifeCycle': 1},
    {'user': 'admin', 'lifeCycle': 2},
    {'user': 'admin', 'lifeCycle': 3},
    {'user': 'admin', 'lifeCycle': 4},
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
        titleList: const ['用户名', '状态', '手机号'],
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
            text: data['user'].toString(),
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
            text: '13565412354',
          ),
        ],
      ),
      // 进度条
    ],
  );
}
