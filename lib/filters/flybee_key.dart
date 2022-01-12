import 'package:zkfly/zkfly.dart';

class FlybeeKey extends ZkValueKey {
  static const beeKeyBtnMonitor = FlybeeKey("btn_monitor");
  static const beeKeyBtnUser = FlybeeKey("btn_user");
  static const beeKeyBtnLogout = FlybeeKey("btn_logout");
  static const beeKeyBtnFixPassword = FlybeeKey("btn_fix_password");
  static const beeKeyUserAdmin = FlybeeKey("btn_user_admin");
  static const beeKeyDeviceAdmin = FlybeeKey("btn_device_admin");
  static const beeKeyLocatorAdmin = FlybeeKey("btn_locator_admin");
  const FlybeeKey(String s) : super(s);
}
