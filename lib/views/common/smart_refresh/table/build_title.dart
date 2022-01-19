// 标题
import 'package:flutter/material.dart';

import 'index.dart';

// 自定义表格的标题
Widget buildTitleRow(List<String> titleList,
    {required Function(String e) onTap,
    required Function(String e) onDoubleTap}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2),
    child: Column(
      children: [
        Row(
          children: titleList.map((e) {
            return BuildExpandedCell(
              onTap: () => onTap(e),
              onDoubleTap: () => onDoubleTap(e),
              text: e,
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            );
          }).toList(),
        ),
        const Divider(
          height: 1,
        )
      ],
    ),
  );
}
