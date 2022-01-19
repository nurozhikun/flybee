import 'package:zkfly/zkfly.dart';

class FlybeeKey extends ZkValueKey {
  static const keyMainPage = FlybeeKey("main_page");
  // BottomNavigationBar
  static const beeKeyAmrHome = FlybeeKey("home");
  static const beeKeyAmrMonitor = FlybeeKey("monitor");
  static const beeKeyAmrTask = FlybeeKey("task");
  static const beeKeyAmrVehicle = FlybeeKey("vehicle");

  // btn
  static const beeKeyBtnMonitor = FlybeeKey("btn_monitor");
  static const beeKeyBtnUser = FlybeeKey("btn_user");
  static const beeKeyBtnLogout = FlybeeKey("btn_logout");
  static const beeKeyBtnLogin = FlybeeKey("btn_login");
  static const beeKeyBtnFixPassword = FlybeeKey("btn_fix_password");
  static const beeKeyBtnBack = FlybeeKey("btn_back");

  // admin
  static const beeKeyDeviceAdmin = FlybeeKey("btn_device_admin");
  static const beeKeyLocatorAdmin = FlybeeKey("btn_locator_admin");
  static const beeKeyUserAdmin = FlybeeKey("btn_user_admin");

  // setting
  static const keySettings = FlybeeKey("settings");
  static const keySettingsTap = FlybeeKey("settings_tap");
  static const keySettingsTapPage = FlybeeKey("settings_tap_page");
  static const keyGeneralSet = FlybeeKey("general_set");
  static const keyAbout = FlybeeKey("about");

  // server
  static const keyAreaServer = FlybeeKey("area_server");
  static const keyMainServer = FlybeeKey("main_server");
  static const keySave = FlybeeKey("save");
  static const keyTest = FlybeeKey("test");

  const FlybeeKey(String s) : super(s);
}
