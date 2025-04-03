// ignore_for_file: non_constant_identifier_names

/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:24:26
 * @LastEditTime: 2025-04-03 23:05:17
 * @FilePath: /xmshop/lib/app/modules/category/views/category_view.dart
 * @Description: 分类页面
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';

import '../controllers/category_controller.dart';

import '../../../services/screenAdapter.dart';

/// !!! 一个 Obx 只能监听一个响应式变量

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  Widget _LeftCate() {
    return SizedBox(
      width: ScreenAdapter.width(280),
      height: double.infinity, // double.infinity 表示高度为父元素的高度
      child: Obx(
        () => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: ((context, index) {
            return SizedBox(
              width: double.infinity, // 宽度
              height: ScreenAdapter.height(180), // 高度
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.changeIndex(
                      index,
                      controller.leftCategoryList[index].sId!,
                    );
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: ScreenAdapter.width(10),
                          height: ScreenAdapter.height(46),
                          color: controller.selectIndex.value == index
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                      Center(
                        child: Text(
                          "${controller.leftCategoryList[index].title}",
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            fontWeight: controller.selectIndex.value == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _rightCate() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Obx(
          () => GridView.builder(
            itemCount: controller.rightCategoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 列数
              crossAxisSpacing: ScreenAdapter.width(40), // 列间距
              mainAxisSpacing: ScreenAdapter.height(20), // 行间距
              childAspectRatio: 240 / 340,
            ), // 宽高比
            itemBuilder: ((context, index) {
              String picUrl =
                  "https://xiaomi.itying.com/${controller.rightCategoryList[index].pic}";
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.PRODUCT_LIST, arguments: {
                    "cid": controller.rightCategoryList[index].sId,
                  });
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center, //
                      width: double.infinity, // double.infinity 表示宽度为父元素的宽度
                      child: Image.network(
                        picUrl.replaceAll("\\", "/"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, ScreenAdapter.height(10), 0, 0),
                      child: Text(
                          "${controller.rightCategoryList[index].title}",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(34))),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                child: const Icon(Icons.search),
              ),
              Text("手机",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32)))
            ],
          ),
        ),
        centerTitle: true, // 居中显示
        backgroundColor: Colors.white, // 背景色
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined, color: Colors.black45),
          )
        ],
        elevation: 0, // 去掉阴影
      ),
      body: Row(
        children: [
          _LeftCate(),
          _rightCate(),
        ],
      ),
    );
  }
}
