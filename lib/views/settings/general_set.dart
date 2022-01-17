import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/getxapp/index.dart';

class GeneralSet extends ZkGetfindView<FlyBeeFilter> {
  GeneralSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(title: Text('监控模式'), children: [
          ListTile(
            title: Text('监控模式'),
          )
        ]),
        ExpansionTile(title: Text('未选择'), children: [
          ListTile(
            title: Text('未选择'),
          )
        ]),
        ExpansionTile(title: Text('主题'), children: [
          ListTile(
            title: Text('主题'),
          )
        ]),
        ExpansionTile(title: Text('语言'), children: [
          ListTile(
            title: Text('中文'),
          ),
          ListTile(
            title: Text('English'),
          )
        ]),
        ExpansionTile(title: Text('关于App'), children: [
          ListTile(
            title: Text('版本'),
            trailing: Text('0.0.1'),
          ),
          ListTile(
            title: Text('联系'),
            trailing: Text('0571-88888888'),
          )
        ]),
      ],
    );
  }
}
