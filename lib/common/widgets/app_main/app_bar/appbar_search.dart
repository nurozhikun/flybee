import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../index.dart';

class AppBarSearch extends StatefulWidget {
  const AppBarSearch({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
    this.isSearch,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  // action
  final List<Widget>? actions;

  // controller
  final TextEditingController controller;

  // focusNode
  final FocusNode focusNode;

  // isSearch
  final bool? isSearch;

  // leading
  final Widget? leading;

  // title文本
  final String title;

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  Widget _buildSearch() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.search,
          size: 16.sp,
        ),
        SizedBox(
            width: 200.w,
            child: TextField(
                focusNode: widget.focusNode,
                controller: widget.controller,
                style:
                    TextStyle(color: Colors.white, fontSize: FontSize.sp16.sp),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '编号',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: FontSize.sp14.sp)),
                showCursor: true,
                cursorColor: Colors.white))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: widget.actions,
      leading: widget.leading,
      centerTitle: true,
      title: widget.isSearch ?? false
          ? _buildSearch()
          : Text(
              widget.title,
              style: TextStyle(fontSize: FontSize.sp16.sp),
            ),
    );
  }
}
