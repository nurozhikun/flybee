import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class SmartTableAbstract<T> {
  // 数据_总
  RxList<T> dataList = <T>[].obs;

  // 数据_展示
  RxList<T> dataListCopy = <T>[].obs;

  // 一次展示数
  int pageSize = 10;

  //当前为第几页
  int curPage = 1;

  // 允许上拉加载
  RxBool enableOnLoad = false.obs;

  // 控制器
  RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  // 刷新
  onRefreshAbs(Future request, String type) async {
    await fetchList(request, isRefresh: true, type: type).then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((e) {
      refreshController.refreshFailed();
    });
  }

  // 加载
  onLoadingAbs(Future request, String type) async {
    if (dataListCopy.length < dataList.length) {
      await fetchList(request, type: type).then((_) {
        refreshController.loadComplete();
      }).catchError((_) {
        refreshController.loadFailed();
      });
    } else {
      refreshController.loadNoData();
    }
  }

  // 拉取数据
  Future<void> fetchList(Future request,
      {bool isRefresh = false, String? type}) async {
    // 改变页码
    if (isRefresh) {
      curPage = 1;
    } else {
      curPage++;
    }

    // 如果是刷新，重新获取数据
    if (isRefresh) {
      var result = await request;
      if (result != null) {
        // 需判断
        if (type == 'user') {
          dataList.value = result.users.reversed.toList();
        } else if (type == 'device') {
          dataList.value = result.devices.reversed.toList();
        } else if (type == 'point') {
          dataList.value = result.points.reversed.toList();
        } else if (type == 'task') {
          dataList.value = result.tasks.reversed.toList();
        }
        dataListCopy.clear();
        // 截取总数组部分显示

        if (pageSize < dataList.length) {
          dataListCopy.value = dataList.sublist(0, pageSize);
        } else {
          //返回的数据少于或等于PAGE_SIZE
          dataListCopy.value = List.from(dataList);
        }
      }
      // 若是还有数据，允许上拉加载
      if (dataList.length > dataListCopy.length) {
        enableOnLoad.value = true;
      }
    }

    // 若是上拉加载
    else {
      // 如果现在的数量+一次显示的数量<总长度
      if (dataListCopy.length + pageSize < dataList.length) {
        dataListCopy.addAll(
            dataList.sublist((curPage - 1) * pageSize, curPage * pageSize));
      } else {
        dataListCopy.value = List.from(dataList);
      }
    }
  }

  /// 搜索
  late Worker worker;

  /// 监听
  void initWorker(fun) {
    // 监听搜索变化，1秒后更新
    worker = debounce(
      dataListCopy,
      (value) => fun(),
      time: 0.5.seconds,
    );
  }

  /// 排序
  RxBool isRise = true.obs;
}
