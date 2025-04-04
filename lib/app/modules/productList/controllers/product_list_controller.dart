/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-03 23:02:21
 * @LastEditTime: 2025-04-05 02:14:15
 * @FilePath: /xmshop/lib/app/modules/productList/controllers/product_list_controller.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/models/plist_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class ProductListController extends GetxController {
  // 滚动控制器
  ScrollController scrollController = ScrollController();
  // 商品列表
  RxList<PlistItemModel> plist = <PlistItemModel>[].obs;
  // scaffold 全局 key
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

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

  // 二级导航数据
  List subHeaderList = [
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort":
          -1, // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    },
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "筛选"}
  ];

  // 二级导航选中判断
  RxInt selectHeaderId = 1.obs;

  // 二级导航排序
  String sort = "";

  // 主要解决的问题是排序箭头无法更新
  RxInt subHeaderListSort = 0.obs;

  // 搜索关键词
  String? keywords = Get.arguments['keywords'];
  // 分类id
  String? cid = Get.arguments['cid'];
  // 请求地址
  String apiUri = "";

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

  // 监听滚动条事件
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

  // 获取商品列表数据
  void getPlistData() async {
    // 如果还有数据并且可以加载更多
    if (flag && hasData.value) {
      // 设置为不可加载
      flag = false;

      if (cid != null) {
        apiUri = "/api/plist?cid=$cid&page=$page&pageSize=$pageSize&sort=$sort";
      } else {
        apiUri =
            "/api/plist?search=$keywords&page=$page&pageSize=$pageSize&sort=$sort";
      }

      // 请求数据
      var response = await httpsClient.get(apiUri);
      print(apiUri);
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

  // 二级导航改变的时候触发的方法
  void subHeaderChange(id) {
    if (id == 4) {
      // 弹出侧边栏
      selectHeaderId.value = id;
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else {
      selectHeaderId.value = id;

      // 改变排序  sort=price_-1     sort=price_1
      sort =
          "${subHeaderList[id - 1]["fileds"]}_${subHeaderList[id - 1]["sort"]}";
      // 改变状态
      subHeaderList[id - 1]["sort"] = subHeaderList[id - 1]["sort"] * -1;
      // 作用更新状态
      subHeaderListSort.value = subHeaderList[id - 1]["sort"];
      // 重置page
      page = 1;
      // 重置数据
      plist.value = [];
      // 重置hasData
      hasData.value = true;
      // 滚动条回到顶部
      scrollController.jumpTo(0);
      // 重新请求接口
      getPlistData();
    }
  }
}
