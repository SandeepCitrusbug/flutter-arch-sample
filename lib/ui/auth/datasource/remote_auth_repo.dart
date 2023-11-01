import 'package:blockrx/ui/auth/datasource/auth_data_source.dart';
import 'package:blockrx/ui/auth/models/rest/req/req_login.dart';
import 'package:blockrx/ui/auth/models/rest/res/res_login.dart';
import 'package:blockrx/service/api_service.dart';
import 'package:blockrx/utils/rest_const.dart';

class RemoteDataSource implements AuthDataSource {
  @override
  Stream<ResLogin> login(ReqLogin reqLogin) {
    return Stream.fromFuture(
      RestClient().dio()!.post(
            RestConst.login,
            data: reqLogin.toJson(),
          ),
    ).map(
      (response) => ResLogin.fromJson(response.data),
    );
  }
}
