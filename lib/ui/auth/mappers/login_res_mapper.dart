import 'package:blockrx/base/base_mapper.dart';
import 'package:blockrx/ui/auth/models/login_data.dart';
import 'package:blockrx/ui/auth/models/rest/res/res_login.dart';

class LoginResponseMapper extends BaseMapper<ResLogin, LoginData> {
  @override
  LoginData map(ResLogin t) {
    return LoginData(
      id: t.id,
      token: t.token,
      role: t.role,
    );
  }
}
