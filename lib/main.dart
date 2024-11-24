import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'common/routers/index.dart';
import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_, child) => GetMaterialApp(
              title: '惠分期',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff2B66FF)),
                useMaterial3: true,
              ),
              defaultTransition: Transition.cupertino,
              transitionDuration: const Duration(milliseconds: 200),
              debugShowCheckedModeBanner: false,
              initialRoute: RoutePages.INITIAL,
              getPages: RoutePages.routes,
              navigatorObservers: [RoutePages.observer, FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
            ));
  }
}
