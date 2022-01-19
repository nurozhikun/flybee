import 'package:flutter/material.dart';

Widget mapTab(MapEntry<int, String?> ele) {
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
              (ele.key + 1).toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ),
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
