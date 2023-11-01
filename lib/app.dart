import 'package:blockrx/service/route_service.dart';
import 'package:blockrx/utils/color_const.dart';
import 'package:blockrx/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'BlocRX',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigationKey,
        initialRoute: RouteConstants.login,
        onGenerateRoute: RouteManager.onGenerateRoute,
        theme: ThemeData(
          fontFamily: AppTextStyles.poppins,
          primaryColor: ColorConst.primaryBlack,
          scaffoldBackgroundColor: ColorConst.primaryBg,
          colorScheme: const ColorScheme.light(
            primary: ColorConst.primaryBlack,
          ),
          checkboxTheme: const CheckboxThemeData(
            fillColor: MaterialStatePropertyAll(ColorConst.primaryBlack),
          ),
          radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(ColorConst.primaryBlack),
          ),
        ),
      ),
    );
  }
}
