import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'table/build_title.dart';

class SmartRefreshView extends StatelessWidget {
  const SmartRefreshView(
      {Key? key,
      required this.buildDataItem,
      required this.titleList,
      required this.controller})
      : super(key: key);
  final Function(int) buildDataItem;
  final List<String> titleList;
  final RefreshController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitleRow(titleList, onTap: (e) {}, onDoubleTap: (e) {}),
        Expanded(
            child: SmartRefresher(
          enablePullUp: true,
          header: const WaterDropHeader(),
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowAlways,
            completeDuration: Duration(microseconds: 50),
          ),
          onRefresh: () {},
          onLoading: () {},
          controller: controller,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, index) {
                return buildDataItem(index);
              }),
        )),
      ],
    );
  }
}
