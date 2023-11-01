import 'package:blockrx/base/env_enums.dart';
import 'package:blockrx/utils/rest_const.dart';

import 'main_base.dart';

void main() {
  start(
    baseUrl: RestConst.baseProd,
    environment: AppEnvironment.production,
  );
}
