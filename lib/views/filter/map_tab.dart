import 'package:flutter/material.dart';

Widget mapTab(ele) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              (ele['progress'] + 1).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 2),
          child: Text(
            ele['title'],
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

/// 导航栏数据集合
List tabData = [
  {
    'title': '主服务器',
    'progress': 0,
  },
  {
    'title': '区服务器',
    'progress': 1,
  },
  {
    'title': '通用设置',
    'progress': 2,
  }
];
