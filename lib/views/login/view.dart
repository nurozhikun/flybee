import 'package:flutter/material.dart';
import 'package:flybee/common/index.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (C) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: getAppBar(C.isHandleLogin ? 'login'.tr : 'changePass'.tr),
            body: Padding(
              padding: EdgeInsets.all(10.sp), //内边距
              child: Column(
                children: [
                  _buildForm(C),
                  _buildForget(C),
                  GradientButton(
                    width: 0.5.sw,
                    colors: [
                      Get.theme.primaryColorLight,
                      Get.theme.primaryColor
                    ],
                    text: C.isHandleLogin ? "登录" : "提交",
                    onPressed: C.handleSignIn,
                  ),
                ],
              ),
            )));
  }
}

// 表单
Widget _buildForm(LoginController C) {
  return Form(
    key: C.formKey,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 用户名
        TextFormFieldView(
            controller: C.aController,
            focusNode: C.aFocusNode,
            labelText: '用户名*',
            enabled: C.isHandleLogin,
            hintText: 'username',
            validator: validateUserName,
            prefixIcon: const Icon(Icons.person)),
        const Divider(
          height: 2,
        ),
        // 密码
        TextFormFieldView(
          controller: C.bController,
          focusNode: C.bFocusNode,
          labelText: '密码*',
          hintText: 'password',
          validator: validatePassWord,
          prefixIcon: const Icon(Icons.lock),
          pass: true,
          // 是否显示密码
        ),
        const Divider(
          height: 2,
        ),
      ],
    ),
  );
}

// 忘记密码
Widget _buildForget(LoginController C) {
  return C.isHandleLogin
      ? Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              snackBar('联系管理员，重置密码', true);
            },
            child: Text(
              '忘记密码?',
              style: TextStyle(fontSize: FontSize.sp14.sp),
            ),
          ),
        )
      : const Text('');
}
