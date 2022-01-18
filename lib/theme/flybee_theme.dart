import 'package:flutter/material.dart';
import 'package:zkfly/zkfly.dart';

Map<ZkValueKey, ThemeData> themes = {
  ZkValueKey.keyThemeTeal: ThemeData(
    primarySwatch: Colors.teal,
  ),
  ZkValueKey.keyThemeIndigo: ThemeData(
    primarySwatch: Colors.indigo,
  ),
  ZkValueKey.keyThemePink: ThemeData(
    primarySwatch: Colors.pink,
  ),
};

class FlybeeTheme extends ZkGetxTheme {
  FlybeeTheme() : super(themes);
}
