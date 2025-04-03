/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-03 23:02:21
 * @LastEditTime: 2025-04-04 00:45:23
 * @FilePath: /xmshop/lib/app/modules/productList/views/product_list_view.dart
 * @Description: 商品列表页面
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import 'package:xmshop/app/services/screenAdapter.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  Widget _productListWidget() {
    return Obx(
      () => controller.plist.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              padding: EdgeInsets.fromLTRB(
                ScreenAdapter.width(26),
                ScreenAdapter.width(140),
                ScreenAdapter.width(26),
                ScreenAdapter.height(26),
              ),
              itemCount: controller.plist.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenAdapter.height(4)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //行
                      child: Row(
                        children: [
                          //左侧
                          Container(
                            padding: EdgeInsets.all(ScreenAdapter.width(60)),
                            width: ScreenAdapter.width(400),
                            height: ScreenAdapter.height(460),
                            child: Image.network(
                              "${HttpsClient.replaeUri("/${controller.plist[index].sPic}")}",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          //右侧
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(20)),
                                  child: Text(
                                    "${controller.plist[index].title}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(42),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(20)),
                                  child: Text(
                                    "${controller.plist[index].subTitle}",
                                    style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.height(20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "CUP",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Helio G25",
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(34),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "高清拍摄",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "1300万像素",
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(34),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "超大屏",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "6.1寸",
                                              style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(34),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "￥${controller.plist[index].price}起",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    (index == controller.plist.length - 1)
                        ? _progressIndicator()
                        : const SizedBox(
                            height: 12,
                          )
                  ],
                );
              })
          : _progressIndicator(),
    );
  }

  Widget _subHeaderWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: ScreenAdapter.height(120),
        width: ScreenAdapter.width(1080),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: ScreenAdapter.height(2),
              color: const Color.fromRGBO(233, 233, 233, 0.9),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(16),
                    0,
                    ScreenAdapter.height(16),
                  ),
                  child: Text(
                    "综合",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, ScreenAdapter.height(16), 0, ScreenAdapter.height(16)),
                  child: Text("销量",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32))),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(16),
                    0,
                    ScreenAdapter.height(16),
                  ),
                  child: Text(
                    "价格",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    ScreenAdapter.height(16),
                    0,
                    ScreenAdapter.height(16),
                  ),
                  child: Text(
                    "筛选",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  ),
                ),
                onTap: () {
                  // 注意：新版本中ScaffoldState? 为可空类型 注意判断
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressIndicator() {
    if (controller.hasData.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Center(
        child: Text("没有数据了哦，我是有底线的"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(900),
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
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [_productListWidget(), _subHeaderWidget()],
      ),
    );
  }
}
