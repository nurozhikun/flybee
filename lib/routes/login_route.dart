import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:flybee/views/appbars.dart';
import 'package:flybee/views/user_drawer.dart';
import 'package:zkfly/app/index.dart';
import 'package:zkfly/appviews/index.dart';
import 'package:zkfly/getxapp/index.dart';

class LoginRoute extends ZkGetputView<FlyBeeFilter> {
  LoginRoute({Key? key = ZkValueKey.keyLogin})
      : super(
          key: key,
          filter: FlyBeeFilter(),
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserDrawer(),
      appBar: BeeAppBar(
        key: key,
      ),
      body: ZkLoginView(
        key: key,
        filter: controller,
      ),
    );
  }
}
