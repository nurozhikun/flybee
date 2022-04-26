import 'package:flutter/material.dart';
import 'package:zkfly/zkfly.dart';
import 'en_US.dart';
import 'zh_CN.dart';

const trans = <String, Map<String, String>>{
  "en_US": enUS,
  "zh_CN": zhCN,
};

List<Locale> localeList = [
  const Locale('zh', 'CH'),
  const Locale('en', 'US'),
];

class FlybeeTranslations extends ZkGetxTranslations {
  FlybeeTranslations() : super(trans);
}

// or
ZkGetxTranslations createTranslations() {
  return ZkGetxTranslations(trans);
}
