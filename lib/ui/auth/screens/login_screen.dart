import 'package:blockrx/base/base_bloc.dart';
import 'package:blockrx/base/base_stateful_widget.dart';
import 'package:blockrx/ui/auth/bloc/login_bloc.dart';
import 'package:blockrx/utils/color_const.dart';
import 'package:blockrx/utils/app_utils.dart';
import 'package:blockrx/utils/extensions.dart';
import 'package:blockrx/utils/image_const.dart';
import 'package:blockrx/utils/text_styles.dart';
import 'package:blockrx/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final LoginBloc _loginBloc = LoginBloc();

  final TextEditingController _emailCTR = TextEditingController();
  final TextEditingController _passwordCTR = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.vs,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Image.asset(ImageConsts.appLogo),
                ),
                32.vs,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Enter your email & password to access your account.",
                    style: AppTextStyles.medium(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                48.vs,
                Text(
                  "Email",
                  style: AppTextStyles.medium(
                    fontSize: 16,
                    color: ColorConst.fontColorBlack,
                  ),
                ),
                8.vs,
                AppTextFormFields(
                  controller: _emailCTR,
                  label: 'Email',
                  showError: true,
                  validator: AppUtils.validateEmail,
                  textInputAction: TextInputAction.next,
                ),
                28.vs,
                Text(
                  "Password",
                  style: AppTextStyles.medium(
                    fontSize: 16,
                    color: ColorConst.fontColorBlack,
                  ),
                ),
                8.vs,
                AppTextFormFields(
                  controller: _passwordCTR,
                  label: 'password',
                  showError: true,
                  obscureText: !isPasswordVisible,
                  validator: AppUtils.validateNotEmpty,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    child: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                8.vs,
                38.vs,
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text("LOGIN"),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _loginBloc.login(
                          _emailCTR.text.trim(),
                          _passwordCTR.text.trim(),
                        );
                      }
                    },
                  ),
                ),
                16.vs,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  BaseBloc? getBaseBloc() {
    return _loginBloc;
  }
}
