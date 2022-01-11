import 'package:zkfly/zkfly.dart';
import 'en_US.dart';
import 'zh_CN.dart';

const trans = <String, Map<String, String>>{
  "en_US": enUS,
  "zh_CN": zhCN,
};

class FlybeeTranslations extends ZkGetxTranslations {
  FlybeeTranslations() : super(trans);
}
