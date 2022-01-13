import 'package:flutter/material.dart';
import 'package:flybee/filters/index.dart';
import 'package:zkfly/appviews/index.dart';
import 'package:zkfly/getxapp/index.dart';

class Login extends ZkGetfindView<FlyBeeFilter> {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZkLoginView(
      key: key,
      filter: controller,
    );
  }
}
