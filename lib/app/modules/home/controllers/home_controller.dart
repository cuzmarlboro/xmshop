/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:17:43
 * @LastEditTime: 2025-04-02 00:43:28
 * @FilePath: /xmshop/lib/app/modules/home/controllers/home_controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/category_model.dart';

class HomeController extends GetxController {
  // 浮动导航开关
  RxBool flag = false.obs;

  // 滚动控制器
  final scrollController = ScrollController();

  // 轮播图列表
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;

  // 分类列表
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // 获取轮播图数据
    getFocusData();
    // 获取分类数据
    getCategoryData();
    // 监听滚动
    scrollControllerListener();
  }

  /// @description: 监听滚动
  /// @return {*}
  void scrollControllerListener() {
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

  /// @description: 获取轮播图数据
  /// @return {*}
  void getFocusData() async {
    try {
      var response = await Dio().get("https://miapp.itying.com/api/focus");
      var focus = FocusModel.fromJson(response.data);
      // print(focus.toJson());
      swiperList.value = focus.result ?? [];
    } catch (e) {
      print(e);
    }
  }

  /// @description: 获取分类数据
  /// @return {*}
  void getCategoryData() async {
    try {
      var response = await Dio().get("https://miapp.itying.com/api/bestCate");
      var category = CategoryModel.fromJson(response.data);
      print(category.toJson());
      categoryList.value = category.result ?? [];
    } catch (e) {
      print(e);
    }
  }
}
