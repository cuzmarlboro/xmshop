import 'package:get/get.dart';

class CategoryController extends GetxController {
  // 当前选中的索引
  RxInt selectIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
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
  /// @return {*}
  void changeIndex(int index) {
    selectIndex.value = index;
  }
}
