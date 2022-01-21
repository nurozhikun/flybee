import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';

class MonitorCard extends StatelessWidget {
  const MonitorCard({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);
  final List items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: circleItems(items, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> circleItems(items, BuildContext context) {
  List<Widget> itemList = [];
  for (var item in items) {
    itemList.add(Column(
      children: [
        InkWell(
          onTap: () {
            // debugDumpRenderTree();
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                item['count'],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          item['title'],
          style: const TextStyle(fontSize: 12),
        )
      ],
    ));
  }
  return itemList;
}
