import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:zkfly_ims/zkfly_ims.dart';

class FlybeeHttpApi extends ImsBeeHttpApi {
  FlybeeHttpApi(BaseOptions? opt) : super(opt) {
    Get.put<FlybeeHttpApi>(this, permanent: true);
  }
}
