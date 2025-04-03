import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductListController extends GetxController {
  // 滚动控制器
  ScrollController scrollController = ScrollController();
  // 商品列表
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;

  // 分页
  int page = 1;

  // 每页数量
  int pageSize = 8;

  // 是否加载更多
  bool flag = true;

  // 是否还有数据
  RxBool hasData = true.obs;

  // 网络请求
  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    // 监听滚动条事件
    initScrollController();

    // 获取数据
    getPlistData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //监听滚动条事件
  void initScrollController() {
    scrollController.addListener(() {
      // 滚动条下拉的高度
      var pixels = scrollController.position.pixels;

      // 页面的高度
      var maxScrollExtent = scrollController.position.maxScrollExtent;

      // 如果滚动条下拉的高度大于页面的高度,则加载更多
      if (pixels > (maxScrollExtent - 20)) {
        getPlistData();
      }
    });
  }

  void getPlistData() async {
    // 如果还有数据并且可以加载更多
    if (flag && hasData.value) {
      // 设置为不可加载
      flag = false;
      // 请求数据
      var response = await httpsClient.get(
          "/api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize");
      print(
          "/api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize");
      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data);
        // 注意:拼接数据
        plist.addAll(plistTemp.result!);
        print(plist.length);
        // 增加页码
        page++;
        // 设置为可加载
        flag = true;
        // 如果数据小于每页数量,则设置为没有数据
        if (plistTemp.result!.length < pageSize) {
          hasData.value = false;
        }
      }
    }
  }
}
