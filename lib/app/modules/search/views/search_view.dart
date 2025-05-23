import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/services/searchServices.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<Search1Controller> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            autofocus: true, // 自动聚焦
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(36),
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0), // 内边距
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black54,
              ), // 前缀图标
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), // 圆角
                borderSide: BorderSide.none, // 边框
              ),
            ),
            onChanged: (value) {
              controller.keywords = value;
            },
            // 监听键盘的回车事件
            onSubmitted: (value) {
              // 保存搜索记录
              SearchServices.setHistoryData(value);
              // 替换路由
              Get.offAndToNamed(
                Routes.PRODUCT_LIST,
                arguments: {"keywords": value},
              );
            },
          ),
        ),
        centerTitle: true, // 居中显示
        backgroundColor: Colors.white, // 背景色
        actions: [
          TextButton(
            onPressed: () {
              // print("搜索");
              //保存搜索记录
              SearchServices.setHistoryData(controller.keywords);
              Get.offAndToNamed(
                Routes.PRODUCT_LIST,
                arguments: {"keywords": controller.keywords},
              );
            },
            child: Text(
              "搜索",
              style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenAdapter.fontSize(36),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          Obx(
            () => controller.historyList.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "搜索历史",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenAdapter.fontSize(42),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.all(
                                  ScreenAdapter.width(20),
                                ),
                                color: Colors.white,
                                width: ScreenAdapter.width(1080),
                                height: ScreenAdapter.height(360),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "您确定要清空历史记录吗?",
                                          style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(48),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: ScreenAdapter.height(40)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: ScreenAdapter.width(420),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                const Color.fromARGB(
                                                    123, 151, 147, 147),
                                              ),
                                              // 字体颜色
                                              foregroundColor:
                                                  WidgetStateProperty.all(
                                                      Colors.white),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text("取消"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenAdapter.width(420),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                const Color.fromARGB(
                                                  123,
                                                  151,
                                                  147,
                                                  147,
                                                ),
                                              ),
                                              // 字体颜色
                                              foregroundColor:
                                                  WidgetStateProperty.all(
                                                Colors.red,
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.clearHistoryData();
                                              Get.back();
                                            },
                                            child: const Text("确定"),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete_forever_outlined),
                        )
                      ],
                    ),
                  )
                : const Text(""),
          ),
          Obx(
            (() => Wrap(
                  children: controller.historyList
                      .map((value) => GestureDetector(
                            // 长按删除
                            onLongPress: () {
                              Get.defaultDialog(
                                title: "提示信息!",
                                middleText: "您确定要删除吗?",
                                confirm: ElevatedButton(
                                  onPressed: () {
                                    controller.removeHistoryData(value);
                                    Get.back();
                                  },
                                  child: const Text("确定"),
                                ),
                                cancel: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("取消"),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                ScreenAdapter.width(32),
                                ScreenAdapter.width(16),
                                ScreenAdapter.width(32),
                                ScreenAdapter.width(16),
                              ),
                              margin: EdgeInsets.all(
                                ScreenAdapter.height(16),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(value),
                            ),
                          ))
                      .toList(),
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "猜你想搜",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(42),
                  ),
                ),
                const Icon(Icons.refresh)
              ],
            ),
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("手机"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("笔记本"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("手机"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("笔记本"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("电脑"),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16),
                    ScreenAdapter.width(32),
                    ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.height(16)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text("路由器"),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // 热销商品
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/hot_search.png"),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: GridView.builder(
                    shrinkWrap:
                        true, // shrinkWrap 的为true时，GridView的宽高会根据子元素的宽高来决定
                    itemCount: 8, // 必须设置
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 交叉轴数量
                      crossAxisSpacing: ScreenAdapter.width(40), // 交叉轴间距
                      mainAxisSpacing: ScreenAdapter.height(20), // 主轴间距
                      childAspectRatio: 3 / 1, // 子元素宽高比
                    ),
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenAdapter.width(120),
                            padding: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Image.network(
                              "https://www.itying.com/images/shouji.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(
                                ScreenAdapter.width(10),
                              ),
                              alignment: Alignment.topLeft,
                              child: const Text("小米净化器 热水器 小米净化器"),
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
