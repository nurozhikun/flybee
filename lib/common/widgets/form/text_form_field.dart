import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../index.dart';

class TextFormFieldView extends StatefulWidget {
  const TextFormFieldView(
      {Key? key,
      required this.controller,
      required this.focusNode,
      this.enabled,
      required this.labelText,
      required this.hintText,
      this.validator,
      this.prefixIcon,
      this.pass,
      this.textInputType,
      this.inputFormatters})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? enabled;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  // 是否是密码
  final bool? pass;

  // 键盘输入类型
  final TextInputType? textInputType;

  // 能输入的判定-字母、数字或符号等
  final List<TextInputFormatter>? inputFormatters;

  @override
  _TextFormFieldViewState createState() => _TextFormFieldViewState();
}

class _TextFormFieldViewState extends State<TextFormFieldView> {
  bool _clearContent = false;
  bool _isShowPwd = false;
  late bool _isPass;

  @override
  void initState() {
    super.initState();
    _isPass = widget.pass ?? false;
    widget.controller.addListener(() {
      _clearContent = widget.controller.text.isNotEmpty;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled ?? true,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: FontSize.sp14.sp),
        fillColor: Colors.white,
        filled: true,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: const Color(0xFFcccccc), fontSize: FontSize.sp12.sp),
        prefixIcon: widget.prefixIcon,
        //尾部添加清除按钮
        suffixIcon: _isPass
            ? IconButton(
                icon: Icon(
                  _isShowPwd ? Icons.visibility : Icons.visibility_off,
                  size: FontSize.sp16,
                ),
                // 点击改变显示或隐藏密码
                onPressed: () {
                  _isShowPwd = !_isShowPwd;
                  setState(() {});
                },
              )
            : (_clearContent
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    iconSize: FontSize.sp14.sp,
                    onPressed: () {
                      widget.controller.clear();
                    },
                  )
                : null),
      ),
      obscureText: _isPass ? !_isShowPwd : false,
      style: TextStyle(
        fontSize: FontSize.sp14.sp,
      ),
      //验证
      validator: widget.validator,
      // 软键盘右下角_完成/下一项
      // textInputAction: TextInputAction.next,
    );
  }
}
