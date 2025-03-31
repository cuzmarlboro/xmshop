/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:24:26
 * @LastEditTime: 2025-03-31 22:00:02
 * @FilePath: /xmshop/lib/app/modules/category/views/category_view.dart
 * @Description: 分类页面
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

import '../../../services/screenAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(600),
            color: Colors.yellow,
            child: Text(
              "手机",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
            ),
          )
        ],
      ),
    );
  }
}
