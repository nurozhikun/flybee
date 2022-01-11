import 'package:get/get.dart';
import 'package:zkfly/common/index.dart';

class LoginController extends GetxController with FormAbstract {
  /// ''''''''''''''状态'''''''''''''''
  // 操作类型：登录/修改密码
  late bool isHandleLogin;

  /// ''''''''''''''方法'''''''''''''''

  // 执行登录/修改操作
  void handleSignIn() {
    if (formKey.currentState!.validate()) {
      unfocusFun();
      if (isHandleLogin) {
        userLoginRequest(aController.text, bController.text);
      } else {
        changePwdRequest(aController.text, bController.text);
      }
    }
  }

  /// ''''''''''''''生命周期'''''''''''''''
  @override
  void onInit() {
    isHandleLogin =
        Get.arguments == null ? true : Get.arguments['handleType'] == 'login';
    if (!isHandleLogin) {
      aController.text = Get.arguments['user'].user;
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    exit();
    super.onClose();
  }
}
