import 'package:get/get.dart';
import 'package:xmshop/app/services/searchServices.dart';
import 'package:xmshop/app/services/storage.dart';

class Search1Controller extends GetxController {
  String keywords = "";

  // 历史搜索记录
  RxList historyList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 获取历史搜索记录
  getHistoryData() async {
    var tempList = await SearchServices.getHistoryData();
    if (tempList.isNotEmpty) {
      historyList.addAll(tempList);
    }
    update();
  }

  // 清空历史搜索记录
  clearHistoryData() async {
    await SearchServices.clearHistoryData();
    historyList.clear();
  }

  // 删除历史搜索记录
  removeHistoryData(keywords) async {
    var tempList = await SearchServices.getHistoryData();
    if (tempList.isNotEmpty) {
      historyList.remove(keywords);
      await SearchServices.deleteHistoryData(keywords);
    }
  }
}
