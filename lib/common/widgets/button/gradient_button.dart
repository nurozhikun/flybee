// 自定义按钮

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../index.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.colors,
    this.width,
    this.height,
    this.style,
    this.prefixIcon,
    this.onPressed,
    this.borderRadius,
    required this.text,
  }) : super(key: key);

  // 渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;

  final String? text;
  final TextStyle? style;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<Color> _colors = colors!;

    Color? _backgroundColors; // 单色
    LinearGradient? _linearGradient; // 渐变色

    if (_colors.isEmpty) {
      _backgroundColors = theme.primaryColorDark;
      _linearGradient = null;
    } else if (_colors.length == 1) {
      _backgroundColors = _colors[0];
      _linearGradient = null;
    } else {
      _backgroundColors = null;
      _linearGradient = LinearGradient(colors: _colors);
    }

    return Ink(
      decoration: BoxDecoration(
        color: _backgroundColors,
        gradient: _linearGradient,
        borderRadius: borderRadius ?? BorderRadius.circular(25.r),
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          width: width ?? 80.0.w,
          height: height ?? 36.0.h,
          child: Center(
            child: Text(
              text!,
              style: style ??
                  TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.sp14.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 使用： HexToColor("#333333")
class HexToColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (hexColor.length != 6 ||
        int.tryParse(hexColor.substring(0, 6), radix: 16) == null) {
      hexColor = '103580';
    }
    hexColor = "FF" + hexColor;
    return int.parse(hexColor, radix: 16);
  }

  HexToColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
