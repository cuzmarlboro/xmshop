/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:24:25
 * @LastEditTime: 2025-04-03 22:47:35
 * @FilePath: /xmshop/lib/app/modules/category/controllers/category_controller.dart
 * @Description: 分类控制器
 */
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:xmshop/app/models/category_model.dart';
import 'package:xmshop/app/services/httpsClient.dart';

class CategoryController extends GetxController {
  // 当前选中的索引
  RxInt selectIndex = 0.obs;

  // 左侧分类列表
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  // 右侧分类列表
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;

  // 网络请求实例
  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();

    //测试：静态属性共享存储空间
    print("-------静态属性共享存储空间-------");

    print(identical(HttpsClient.domain, HttpsClient.domain)); //true

    HttpsClient httpsClient1 = HttpsClient();
    HttpsClient httpsClient2 = HttpsClient();
    print(identical(httpsClient1, httpsClient2)); //false

    // 获取左侧分类数据
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// @description: 设置当前选中的索引
  /// @param {int} index
  /// @param {String} id
  /// @return {*}
  void changeIndex(int index, String id) {
    selectIndex.value = index;
    // 获取右侧分类数据
    getRightCategoryData(id);
  }

  /// @description: 获取左侧分类数据
  /// @return {*}
  getLeftCategoryData() async {
    var response = await httpsClient.get("/api/pcate");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      leftCategoryList.value = category.result!;
      // 获取左侧分类数据后，通过第一个分类的id获取右侧分类数据
      getRightCategoryData(leftCategoryList[0].sId!);
    }
  }

  /// @description: 获取右侧分类数据
  /// @param {String} pid
  /// @return {*}
  getRightCategoryData(String pid) async {
    var response = await httpsClient.get("/api/pcate?pid=$pid");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      rightCategoryList.value = category.result!;
    }
  }
}
