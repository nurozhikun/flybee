import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../index.dart';

AppBar getAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    toolbarHeight: 50.h,
    title: Text(
      title,
      style: TextStyle(fontSize: FontSize.sp16.sp),
    ),
    elevation: 0, //阴影
    centerTitle: true, //居中
    actions: actions,
  );
}
