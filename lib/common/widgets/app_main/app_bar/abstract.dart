import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppBarAbstract {
  // 标题/搜索?
  RxBool isSearch = false.obs;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // 搜索栏显示
  void change2SearchObx() {
    searchController.text = '';
    searchFocusNode.unfocus();
    isSearch.value = !isSearch.value;
  }
}
