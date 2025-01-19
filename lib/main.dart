import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_getway/utils/common/initial_binding.dart';
import 'package:payment_getway/utils/constant/routers_const.dart';
import 'package:payment_getway/utils/constant/string_const.dart';
import 'package:payment_getway/utils/routes_page.dart';
import 'package:payment_getway/utils/theme/app_theme.dart';
import 'package:payment_getway/view/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(AppController());
    return GetMaterialApp(
      title: StringConst.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.light,
      unknownRoute:
          GetPage(name: RoutersConst.initialRoute, page: () => SplashPage()),
      darkTheme: lightThemeData(context),
      theme: lightThemeData(context),
      initialRoute: RoutersConst.initialRoute,
      getPages: RoutesPage(),
    );
  }
}
