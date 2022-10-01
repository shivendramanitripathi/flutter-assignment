
import 'package:get/get.dart';
import 'package:speakyeasy/views/home/home_binding.dart';
import 'package:speakyeasy/views/home/home_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
