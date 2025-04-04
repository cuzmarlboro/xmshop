import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/routes/app_pages.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

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
          Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)), // 底部内边距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // 两端对齐
              children: [
                Text(
                  "搜索历史",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(42),
                  ),
                ),
                const Icon(Icons.delete_forever_outlined)
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
                  ScreenAdapter.width(16),
                ),
                margin: EdgeInsets.all(ScreenAdapter.height(16)), // 外边距
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
                  ScreenAdapter.width(16),
                ),
                margin: EdgeInsets.all(
                  ScreenAdapter.height(16),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("笔记本"),
              ),
              Container(
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
                child: const Text("电脑"),
              ),
              Container(
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
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("猜你想搜",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenAdapter.fontSize(42))),
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
