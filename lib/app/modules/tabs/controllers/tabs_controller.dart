/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:23:42
 * @LastEditTime: 2025-04-03 00:50:05
 * @FilePath: /xmshop/lib/app/modules/tabs/controllers/tabs_controller.dart
 * @Description: tabs 控制器
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../home/views/home_view.dart';
import '../../user/views/user_view.dart';

class TabsController extends GetxController {
  // 当前选中的索引
  RxInt currentIndex = 1.obs;

  // 页面控制器
  PageController pageController = PageController(initialPage: 1);

  // 页面列表
  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// @description: 设置当前选中的索引
  /// @param {int} index
  /// @return {*}
  void setCurrentIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
