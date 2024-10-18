import 'package:app/core/design/navigator.dart';
import 'package:app/core/design/theme.dart';
import 'package:app/core/logic/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/color_test.dart';

late int initScreen;

Future<void> main() async {
  initServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ProjectAmit63',
        navigatorKey: navigatorKey,
        home: ColorTest(),
        theme: lightMode,
        darkTheme: darkMode,
      ),
    );
  }
}

/*
git add .
git commit -m " **commit** "
git push origin main
 */
