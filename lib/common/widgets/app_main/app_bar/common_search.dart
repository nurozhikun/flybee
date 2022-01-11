import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'appbar_search.dart';

PreferredSize commonSearch(C, String title) {
  return PreferredSize(
      preferredSize: Size(Get.width, 50.h),
      child: AppBarSearch(
        isSearch: C.isSearch.value,
        title: title,
        actions: [
          IconButton(
            icon: Icon(
              C.isSearch.value ? Icons.close : Icons.search,
              size: 16.sp,
            ),
            onPressed: C.change2Search,
          )
        ],
        controller: C.searchController,
        focusNode: C.searchFocusNode,
      ));
}
