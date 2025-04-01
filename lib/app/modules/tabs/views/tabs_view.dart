/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:23:42
 * @LastEditTime: 2025-04-01 22:09:39
 * @FilePath: /xmshop/lib/app/modules/tabs/views/tabs_view.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

// GetView 注入了 TabsController 控制器
class TabsView extends GetView<TabsController> {
  const TabsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // body: controller.pages[controller.currentIndex.value], // 当前选中的页面
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // 禁止滑动
          controller: controller.pageController, // 页面控制器
          children: controller.pages, // 页面列表
          onPageChanged: (index) {
            controller.setCurrentIndex(index); // 设置当前选中的索引
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red, // 选中的颜色
          currentIndex: controller.currentIndex.value, // 当前选中的索引
          type: BottomNavigationBarType.fixed, // 如果底部有4个或者4个以上的菜单的时候就需要配置这个参数
          onTap: (index) {
            // 设置当前选中的索引
            controller.setCurrentIndex(index);
            // 跳转到 PageView 指定页面
            controller.pageController.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
            BottomNavigationBarItem(
                icon: Icon(Icons.room_service), label: "服务"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "购物车"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
          ],
        ),
      ),
    );
  }
}
