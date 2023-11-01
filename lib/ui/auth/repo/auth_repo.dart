import 'package:blockrx/ui/auth/datasource/auth_data_source.dart';
import 'package:blockrx/ui/auth/datasource/mock_data_source.dart';
import 'package:blockrx/ui/auth/mappers/login_res_mapper.dart';
import 'package:blockrx/ui/auth/models/login_data.dart';
import 'package:blockrx/ui/auth/models/rest/req/req_login.dart';

class AuthRepo {
  final LoginResponseMapper mapper = LoginResponseMapper();

  //mock datasource
  AuthDataSource get _getDataSource => MockDataSource();

  //TODO: - Replace with remote datasource for actual api call
  // //Remote server api call datasource
  // AuthDataSource get _getDataSource => RemoteDataSource();

  Stream<LoginData> login(ReqLogin reqLogin) {
    return _getDataSource.login(reqLogin).map((event) => mapper.map(event));
  }
}
