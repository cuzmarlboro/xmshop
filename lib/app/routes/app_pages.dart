/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:17:43
 * @LastEditTime: 2025-03-31 20:38:45
 * @FilePath: /xmshop/lib/app/routes/app_pages.dart
 * @Description: 
 */
import 'package:get/get.dart';

import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(), // 依赖注入
    ),
  ];
}
