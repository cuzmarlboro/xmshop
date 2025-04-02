/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:17:43
 * @LastEditTime: 2025-04-03 00:37:28
 * @FilePath: /xmshop/lib/app/modules/home/controllers/home_controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/models/focus_model.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/models/plist_model.dart';

class HomeController extends GetxController {
  // 浮动导航开关
  RxBool flag = false.obs;

  // 滚动控制器
  final scrollController = ScrollController();

  // 轮播图列表
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;

  // 分类列表
  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;

  // 热销甄选轮播图列表
  RxList<FocusItemModel> bestSellingSwiperList = <FocusItemModel>[].obs;

  // 热销臻选商品列表
  RxList<PlistItemModel> sellingPlist = <PlistItemModel>[].obs;

  // 省心优惠商品列表
  RxList<PlistItemModel> bestPlist = <PlistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // 获取轮播图数据
    getFocusData();
    // 获取分类数据
    getCategoryData();
    // 获取热销臻选里面的轮播图
    getSellingSwiperData();
    // 获取热销臻选里面的商品数据
    getSellingPlistData();
    // 省心优惠商品列表
    getBestPlistData();
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

  /// @description: 获取热销臻选里面的轮播图
  /// @return {*}
  void getSellingSwiperData() async {
    var response =
        await Dio().get("https://miapp.itying.com/api/focus?position=2");
    var sellingSwiper = FocusModel.fromJson(response.data);
    bestSellingSwiperList.value = sellingSwiper.result!;
  }

  /// @description: 获取热销臻选里面的商品数据
  /// @return {*}
  void getSellingPlistData() async {
    var response = await Dio()
        .get("https://miapp.itying.com/api/plist?is_hot=1&pageSize=3");
    var plist = PlistModel.fromJson(response.data);
    sellingPlist.value = plist.result!;
  }

  /// @description: 获取热门商品数据
  /// @return {*}
  void getBestPlistData() async {
    var response =
        await Dio().get("https://miapp.itying.com/api/plist?is_best=1");
    var plist = PlistModel.fromJson(response.data);
    bestPlist.value = plist.result!;
  }
}
