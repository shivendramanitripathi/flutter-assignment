import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:speakyeasy/routes/app_pages.dart';
import 'package:speakyeasy/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}

