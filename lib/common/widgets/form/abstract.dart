import 'package:flutter/material.dart';

abstract class FormAbstract {
  //表单状态
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TextEditingController
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  //焦点
  final FocusNode aFocusNode = FocusNode();
  final FocusNode bFocusNode = FocusNode();
  final FocusNode cFocusNode = FocusNode();

  // 监听焦点
  Future focusNodeListener() async {
    if (aFocusNode.hasFocus) {}
    if (bFocusNode.hasFocus) {}
    if (cFocusNode.hasFocus) {}
  }

  // 设置焦点监听
  void addFocus() {
    aFocusNode.addListener(focusNodeListener);
    bFocusNode.addListener(focusNodeListener);
    cFocusNode.addListener(focusNodeListener);
  }

  // 取消焦点
  void unfocusFun() {
    aFocusNode.unfocus();
    bFocusNode.unfocus();
    cFocusNode.unfocus();
  }

  // 监听文本框输入

  // 退出
  void exit() {
    unfocusFun();
    aController.dispose();
    bController.dispose();
    cController.dispose();
    aFocusNode.removeListener(focusNodeListener);
    bFocusNode.removeListener(focusNodeListener);
    cFocusNode.removeListener(focusNodeListener);
  }
}
