import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/getxapp/index.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';

class UserDrawer extends ZkGetfindView<FlyBeeFilter> {
  UserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          drawerHeader(),
          // drawerItem('退出登录', Icons.power_settings_new, () {}),
          _drawerItem(FlybeeKey.beeKeyBtnLogout),
          const Divider(),
          Column(
            children: [
              // drawerItem('修改密码', Icons.lock, () {}),
              const Divider(), //分割线
              _drawerItem(FlybeeKey.beeKeyBtnFixPassword),
            ],
          ),
          Column(
            children: [
              drawerItem('用户管理', Icons.person_add, () {}),
              const Divider(), //分割线
              drawerItem('设备管理', Icons.devices_rounded, () {}),
              const Divider(), //分割线
              drawerItem('库位管理', Icons.category, () {}),
              const Divider(), //分割线
            ],
          )
        ],
      ),
    );
  }

  Widget _drawerItem(ZkValueKey key) {
    return InkWell(
      onTap: () => controller.onPressed(key),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(
                child: _iconOfKey(key),
                backgroundColor: Get.theme.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              controller.labelTextOf(key) ?? key.value,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _iconOfKey(ZkValueKey key) {
    return controller.prefixIconOf(key);
  }

  Widget drawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Get.theme.primaryColorLight, Get.theme.primaryColor],
      )),
      accountName: const Padding(
        padding: EdgeInsets.only(left: 6),
        child: Text(
          'admin',
          style: TextStyle(fontSize: 20),
        ),
      ),
      accountEmail: const Padding(
        padding: EdgeInsets.only(left: 6),
        child: Text(
          '13757151027',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      onDetailsPressed: null,
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/userimg.jpg'),
      ),
    );
  }
}

Widget drawerItem(String title, IconData icon, Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: CircleAvatar(
              child: Icon(
                icon,
                size: 16,
              ),
              backgroundColor: Get.theme.primaryColor,
            ),
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
