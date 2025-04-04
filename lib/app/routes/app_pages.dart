import 'package:get/get.dart';

import '../modules/productList/bindings/product_list_binding.dart';
import '../modules/productList/views/product_list_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TABS;
  // static const INITIAL = Routes.SEARCH;
  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(), // 依赖注入
    ),
    GetPage(
      name: _Paths.PRODUCT_LIST,
      page: () => const ProductListView(),
      binding: ProductListBinding(),
    ),
    GetPage(
      transition: Transition.fadeIn, // 过渡动画，淡入淡出
      transitionDuration: const Duration(milliseconds: 200), // 过渡动画时间
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
