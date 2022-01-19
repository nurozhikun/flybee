import 'package:flutter/material.dart';

// 自定义表格的cell
class BuildExpandedCell extends StatelessWidget {
  const BuildExpandedCell(
      {Key? key,
      required this.text,
      this.textStyle,
      this.onTap,
      this.onDoubleTap,
      this.textColor,
      this.containerColor,
      this.padding})
      : super(key: key);

  // 文本
  final String text;

  // 文本样式
  final TextStyle? textStyle;

  // 文本颜色
  final Color? textColor;

  // container颜色
  final Color? containerColor;

  // 单击
  final Function()? onTap;

  // 双击
  final Function()? onDoubleTap;

  // padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: InkWell(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
            ),
            child: Text(
              text,
              style: textStyle ??
                  TextStyle(
                      fontSize: 14,
                      color: textColor,
                      overflow: TextOverflow.ellipsis),
            ),
          ),
        ),
      ),
    );
  }
}
