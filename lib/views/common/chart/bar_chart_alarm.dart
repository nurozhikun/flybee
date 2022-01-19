import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zkfly/zkfly.dart';
import 'package:flybee/filters/index.dart';

class BarChartAlarm extends ZkGetfindView<FlyBeeFilter> {
  BarChartAlarm({Key? key, required this.data, this.width}) : super(key: key);
  final List data;

  // 宽度
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      width: width,
      child: BarChart(
        BarChartData(
            // 设置为center对齐，才能使groupsSpace生效
            alignment: BarChartAlignment.center,
            maxY: 100,
            // barGroups之间距离
            groupsSpace: 90,
            barGroups: data.map((e) {
              return BarChartGroupData(
                x: e["xAxis"],
                barRods: [
                  BarChartRodData(
                    y: e["yAxis"],
                    width: 25,
                    // 设置多组颜色会形成渐变
                    colors: [Get.theme.primaryColor],
                    borderRadius: BorderRadius.zero,
                  ),
                ],
              );
            }).toList(),

            // 坐标轴上的刻度设置
            titlesData: _buildTitles(),

            // 上下左右标题
            axisTitleData: _buildFlAxisTitleData(),

            // barTouch数据,点击每个bar显示数据的样式
            barTouchData: _buildBarTouchData(),

            // BorderData,图表的边框
            borderData: _buildFlBorderData()),
      ),
    );
  }

  /// 坐标
  //? 坐标配置
  FlTitlesData _buildTitles() {
    return FlTitlesData(
      show: true,
      //? 左侧标题
      leftTitles: _buildLeftTitle(),
      //? 上侧标题
      topTitles: SideTitles(showTitles: false),
      //? 右侧标题
      rightTitles: SideTitles(showTitles: false),
      //? 下边标题
      bottomTitles: _buildBottomTitle(),
    );
  }

  // 左侧坐标
  SideTitles _buildLeftTitle() {
    return SideTitles(
        // 格式化axis
        getTitles: (text) => "${text.toInt()}",
        // 设置字体颜色
        getTextStyles: (context, text) =>
            const TextStyle(color: Colors.black54, fontSize: 12),
        showTitles: true);
  }

  // 底部坐标
  SideTitles _buildBottomTitle() {
    return SideTitles(
        // 格式化axis
        getTitles: (text) {
          switch (text.toInt()) {
            case 0:
              return '任务';
            case 1:
              return '设备';
            case 2:
              return '库位';
            default:
              return '';
          }
        },
        // 设置字体颜色
        getTextStyles: (context, text) =>
            const TextStyle(color: Colors.black54, fontSize: 12),
        showTitles: true);
  }

  /// 标题
  FlAxisTitleData _buildFlAxisTitleData() {
    return FlAxisTitleData(
      topTitle: AxisTitle(
          titleText: "告警",
          showTitle: false,
          margin: 10,
          textStyle: const TextStyle(fontSize: 16)),
    );
  }

  /// 点击提示
  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      enabled: true,
      // 触摸精度阈值
      touchExtraThreshold: const EdgeInsets.all(4),
      // 是否允许触摸bar的背景，触发触摸事件
      allowTouchBarBackDraw: false,
      // 触摸bar是否显示提示框
      handleBuiltInTouches: true,
      // 触摸bar回调函数
      touchCallback: (flTouchEvent, barTouchResponse) {
        print(barTouchResponse);
      },
      // 触摸提示的内容区域
      touchTooltipData: BarTouchTooltipData(
          // 背景颜色
          tooltipBgColor: Get.theme.primaryColor,
          // 圆角radius
          tooltipRoundedRadius: 10,
          // padding
          tooltipPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          // margin
          tooltipMargin: 10,
          // maxContextWidth
          maxContentWidth: 120,
          // 提示框显示，相当于格式化显示
          getTooltipItem: (barChartGroupData, int_1, barChartRodData, int_2) {
            return BarTooltipItem(barChartRodData.y.toStringAsPrecision(2),
                const TextStyle(color: Colors.white, fontSize: 14),
                children: []);
          }),
    );
  }

  // 边框
  FlBorderData _buildFlBorderData() {
    return FlBorderData(
        border: const Border(
            bottom: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black)));
  }

  // 底部
}
