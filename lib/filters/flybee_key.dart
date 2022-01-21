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
  static const beeKeyBtnSelect = FlybeeKey("btn_select");
  static const beeKeyBtnCancel = FlybeeKey("btn_cancel");
  static const beeKeyBtnConfirm = FlybeeKey("btn_confirm");

  // admin
  static const beeKeyDeviceAdmin = FlybeeKey("btn_device_admin");
  static const beeKeyLocatorAdmin = FlybeeKey("btn_locator_admin");
  static const beeKeyUserAdmin = FlybeeKey("btn_user_admin");

  // setting
  static const beeKeySettings = FlybeeKey("settings");
  static const beeKeySetProgress = FlybeeKey("set_progress");
  static const beeKeySettingsTap = FlybeeKey("settings_tap");
  static const beeKeySettingsTapPage = FlybeeKey("settings_tap_page");
  static const beeKeyGeneralSet = FlybeeKey("general_set");
  static const beeKeyAbout = FlybeeKey("about");
  static const beeKeyVersion = FlybeeKey("version");
  static const beeKeyContract = FlybeeKey("contract");
  static const beeKeyMode = FlybeeKey("mode");
  static const beeKeyLocation = FlybeeKey("location");
  static const beeKeyDeviceSn = FlybeeKey("device_sn");

  // server
  static const beeKeyAreaServer = FlybeeKey("area_server");
  static const beeKeyMainServer = FlybeeKey("main_server");
  static const beeKeySave = FlybeeKey("save");
  static const beeKeyTest = FlybeeKey("test");
  static const beeKeyCommandKey = FlybeeKey("command_key");

  // task
  static const beeKeyTaskToday = FlybeeKey("task_today");
  static const beeKeyIssue = FlybeeKey("issue");
  static const beeKeyCompleted = FlybeeKey("completed");
  static const beeKeyTodo = FlybeeKey("todo");

  // alarm
  static const beeKeyAlarm = FlybeeKey('alarm');

  // point
  static const beeKeyPoint = FlybeeKey('point');

  const FlybeeKey(String s) : super(s);
}
