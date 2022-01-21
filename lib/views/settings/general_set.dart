import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/lang/flybee_translations.dart';
import 'package:flybee/theme/index.dart';
import 'package:zkfly/app/index.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:get/get.dart';

class GeneralSet extends ZkGetfindView<FlyBeeFilter> {
  GeneralSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 功能模式
          ExpansionTile(
              title: Text(controller.labelTextOf(FlybeeKey.beeKeyMode) ?? ''),
              children: [
                ListTile(
                  title: Text(
                      controller.labelTextOf(FlybeeKey.beeKeyAmrMonitor) ?? ''),
                )
              ]),

          // 位置
          ExpansionTile(
              title:
                  Text(controller.labelTextOf(FlybeeKey.beeKeyLocation) ?? ''),
              children: [
                ListTile(
                  leading: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                        controller.labelTextOf(FlybeeKey.beeKeyBtnSelect) ??
                            ''),
                  ),
                  // title: Text(
                  //     controller.labelTextOf(FlybeeKey.beeKeyLocation) ??
                  //         FlybeeKey.beeKeyLocation.value),
                )
              ]),

          // 主题
          ValueBuilder<int?>(
            initialValue: ZkGetxApp.to.shared.themeIndex,
            builder: (value, updateFn) {
              return ExpansionTile(
                  title:
                      Text(controller.labelTextOf(ZkValueKey.keyTheme) ?? ''),
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

          // 语言
          ValueBuilder<int?>(
            initialValue: ZkGetxApp.to.shared.localeIndex,
            builder: (value, updateFn) {
              return ExpansionTile(
                  title: Text(
                      controller.labelTextOf(ZkValueKey.keyLanguage) ?? ''),
                  children: localeList
                      .asMap()
                      .entries
                      .map(
                        (e) => ListTile(
                          leading: Text(e.value.languageCode == 'zh'
                              ? '中文'
                              : e.value.languageCode == 'en'
                                  ? 'English'
                                  : ''),
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
                ZkGetxApp.to.localeIndex = value;
              }
            },
          ),

          // 关于app
          ExpansionTile(
              title: Text(controller.labelTextOf(FlybeeKey.beeKeyAbout) ?? ''),
              children: [
                ListTile(
                  title: Text(
                      controller.labelTextOf(FlybeeKey.beeKeyVersion) ?? ''),
                  trailing: const Text('0.0.1'),
                ),
                ListTile(
                  title: Text(
                      controller.labelTextOf(FlybeeKey.beeKeyContract) ?? ''),
                  trailing: const Text('0571-88888888'),
                )
              ]),
        ],
      ),
    );
  }
}
