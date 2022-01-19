import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/theme/index.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:get/get.dart';

class GeneralSet extends ZkGetfindView<FlyBeeFilter> {
  GeneralSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 功能模式
        const ExpansionTile(title: Text('监控模式'), children: [
          ListTile(
            title: Text('监控模式'),
          )
        ]),

        // 位置
        const ExpansionTile(title: Text('未选择'), children: [
          ListTile(
            title: Text('未选择'),
          )
        ]),

        // 主题
        ValueBuilder<int?>(
          initialValue: ZkGetxApp.to.shared.themeIndex,
          builder: (value, updateFn) {
            return ExpansionTile(
                title: const Text('主题'),
                children: themeList
                    .asMap()
                    .entries
                    .map(
                      (e) => ListTile(
                        leading: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircleAvatar(
                            backgroundColor: e.value.primaryColor,
                          ),
                        ),
                        trailing: (value == e.key)
                            ? const Icon(
                                Icons.check,
                                size: 16,
                              )
                            : const Text(''),
                        onTap: () => updateFn(e.key),
                      ),
                    )
                    .toList());
          },
          onUpdate: (value) {
            if (null != value) {
              ZkGetxApp.to.themeIndex = value;
            }
          },
        ),

        const ExpansionTile(title: Text('语言'), children: [
          ListTile(
            title: Text('中文'),
          ),
          ListTile(
            title: Text('English'),
          )
        ]),
        const ExpansionTile(title: Text('关于App'), children: [
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
