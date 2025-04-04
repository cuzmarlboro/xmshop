/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-05 01:19:47
 * @LastEditTime: 2025-04-05 01:26:58
 * @FilePath: /xmshop/lib/app/modules/search/bindings/search_binding.dart
 * @Description: 
 */
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Search1Controller>(
      () => Search1Controller(),
    );
  }
}
