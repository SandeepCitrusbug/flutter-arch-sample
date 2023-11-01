import 'package:blockrx/base/env_enums.dart';
import 'package:blockrx/main_base.dart';
import 'package:blockrx/utils/rest_const.dart';

void main() {
  start(
    baseUrl: RestConst.baseDev,
    environment: AppEnvironment.development,
  );
}
