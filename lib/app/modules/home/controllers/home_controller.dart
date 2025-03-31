/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:17:43
 * @LastEditTime: 2025-03-31 22:52:41
 * @FilePath: /xmshop/lib/app/modules/home/controllers/home_controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // 是否滚动
  RxBool flag = false.obs;

  // 滚动控制器
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    // 监听滚动
    scrollController.addListener(
      () {
        // 滚动到10px到20px之间，并且flag为false时，flag为true，认定用户开始往下滑动
        print('滚动距离: ${scrollController.offset}');
        print('flag: ${flag.value}');
        if (scrollController.offset > 10 && scrollController.offset < 150) {
          if (flag.value == false) {
            flag.value = true;
            print('开始往下滑动: ${flag.value}');
          }
        }

        // 滚动到10px以下，并且flag为true时，flag为false，认定用户开始往上滑动回顶部
        if (scrollController.offset < 10) {
          if (flag.value == true) {
            flag.value = false;
            print('开始往上滑动回顶部: ${flag.value}');
          }
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
