/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:24:26
 * @LastEditTime: 2025-04-03 01:04:58
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
          SizedBox(
            width: ScreenAdapter.width(280),
            height: double.infinity, // double.infinity 表示高度为父元素的高度
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return SizedBox(
                  width: double.infinity, // 宽度
                  height: ScreenAdapter.height(180), // 高度
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        controller.changeIndex(index);
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
                            child: Text("第$index个"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: GridView.builder(
                itemCount: 35,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 列数
                  crossAxisSpacing: ScreenAdapter.width(40), // 列间距
                  mainAxisSpacing: ScreenAdapter.height(20), // 行间距
                  childAspectRatio: 240 / 340, // 宽高比
                ),
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center, // 居中显示
                        width: double.infinity, // double.infinity 表示宽度为父元素的宽度
                        child: Image.network(
                          "https://xiaomi.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          ScreenAdapter.height(10),
                          0,
                          0,
                        ),
                        child: Text(
                          "手机",
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(34),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
