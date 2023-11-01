import 'package:blockrx/ui/auth/models/rest/req/req_login.dart';
import 'package:blockrx/ui/auth/models/rest/res/res_login.dart';

abstract class AuthDataSource {
  Stream<ResLogin> login(ReqLogin reqLogin);
}