/// 检查邮箱格式
bool duIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  // 邮箱正则
  String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regexEmail).hasMatch(input);
}

/// 检查字符长度
bool duCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}

/// 用户名
bool duCheckUserName(String? input) {
  if (input == null || input.isEmpty) return false;
  String regexUserName = "^[A-Z a-z 0-9 _]{3,8}\$";
  return RegExp(regexUserName).hasMatch(input);
}

// 表单验证
// 用户名
String? validateUserName(value) {
  RegExp exp = RegExp(r'^[\u4e00-\u9fa5 A-Z a-z 0-9 _]{3,8}$');
  if (value.isEmpty) {
    return '用户名不能为空!';
  } else if (!exp.hasMatch(value.trim())) {
    return '请输入3到8位中文、数字、字母、下划线';
  }
  return null;
}

// 密码
String? validatePassWord(value) {
  if (value.isEmpty) {
    return '密码不能为空';
  } else if (value.trim().length < 6 || value.trim().length > 18) {
    return '密码长度需大于6位';
  }
  return null;
}

// 手机号
String? validateTel(value) {
  RegExp exp = RegExp(
      r'^(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}$');
  if (value.isNotEmpty) {
    if (!exp.hasMatch(value.trim())) {
      return '请输入正确的手机号';
    }
  }
  return null;
}

/**
   * 验证服务器ip
   */
String? validateServerIp(value) {
  RegExp exp = RegExp(
      r'^((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})(\.((2(5[0-5]|[0-4]\d))|[0-1]?\d{1,2})){3}$');
  if (value.isEmpty) {
    return '服务器IP不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入正确IP地址，如(192.168.127.253)';
  }
  return null;
}

String? validateServerPort(value) {
  RegExp exp = RegExp(r'^(\d){1,4}$');
  if (value.isEmpty) {
    return '服务器端口不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入正确端口号，如(8000)';
  }
  return null;
}

String? validateDeviceCode(value) {
  RegExp exp = RegExp(r'^[A-Z a-z 0-9 _]{0,8}$');
  if (value.isEmpty) {
    return '设备编号不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入0到8数字、字母、下划线';
  }
  return null;
}

String? validateDeviceName(value) {
  RegExp exp = RegExp(r'^[\u4e00-\u9fa5 A-Z a-z 0-9 _]{0,8}$');
  if (!exp.hasMatch(value)) {
    return '请输入0到8位中文、数字、字母、下划线';
  }
  return null;
}

String? validateDeviceSn(value) {
  RegExp exp = RegExp(r'^[A-Z a-z 0-9 _]{3,18}$');
  if (value.isEmpty) {
    return '设备号不能为空!';
  } else if (!exp.hasMatch(value)) {
    return '请输入3到18位数字、字母、下划线';
  }
  return null;
}

// 用户名
String? validateCommand(value) {
  RegExp exp = RegExp(r'^[\u4e00-\u9fa5 A-Z a-z 0-9 _]{1,8}$');
  if (value.isEmpty) {
    return '口令不能为空!';
  } else if (!exp.hasMatch(value.trim())) {
    return '请输入1到8位中文、数字、字母、下划线';
  }
  return null;
}
