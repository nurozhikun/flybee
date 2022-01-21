import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:get/get.dart';

Widget mapTab(MapEntry<int, String?> ele) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
            width: 20,
            height: 20,
            child: Obx(() => CircleAvatar(
                  backgroundColor: FlyBeeFilter.to.setProgress >= ele.key
                      ? Colors.orange
                      : Colors.grey,
                  child: Text(
                    (ele.key + 1).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ))),
        Container(
          margin: const EdgeInsets.fromLTRB(4, 0, 0, 2),
          child: Text(
            ele.value ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}
