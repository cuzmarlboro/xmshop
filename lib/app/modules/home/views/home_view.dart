import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../controllers/home_controller.dart';

import '../../../services/keepAliveWrapper.dart';
import '../../../services/screenAdapter.dart';

import './HomeAppBar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  // 轮播图
  Widget _focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            String picUrl =
                "https://xiaomi.itying.com/${controller.swiperList[index].pic}";
            return Image.network(
              picUrl.replaceAll("\\", "/"),
              fit: BoxFit.fill,
            );
          },
          itemCount: controller.swiperList.length, // 轮播图数量
          pagination: const SwiperPagination(
            builder: SwiperPagination.rect, // 分页指示器样式
          ), // 分页器
          // control: const SwiperControl(), // 左右箭头
          autoplay: true, // 自动轮播
          // loop: true, // 无限轮播模式开关
          // duration: 1000 // 自动轮播时间
        ),
      ),
    );
  }

  // 小米banner
  Widget _xiaomiBanner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(92),
      child: Image.asset(
        "assets/images/xiaomiBanner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  // 广告banner
  Widget _adBanner() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        ScreenAdapter.width(20),
        ScreenAdapter.width(20),
        ScreenAdapter.width(20),
        0,
      ),
      child: Container(
        height: ScreenAdapter.height(420),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: const DecorationImage(
            image: AssetImage("assets/images/xiaomiBanner2.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // 顶部滑动分类
  Widget _category() {
    return Obx(
      () => Container(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(470),
        color: Colors.white,
        child: Swiper(
          itemBuilder: (context, i) {
            return GridView.builder(
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, // 列数
                crossAxisSpacing: ScreenAdapter.width(20), // 列间距
                mainAxisSpacing: ScreenAdapter.height(20), // 行间距
              ),
              itemBuilder: (context, j) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.height(140),
                      height: ScreenAdapter.height(140),
                      child: Image.network(
                        "https://xiaomi.itying.com/${controller.categoryList[i * 10 + j].pic}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        ScreenAdapter.height(4),
                        0,
                        0,
                      ),
                      child: Text(
                        controller.categoryList[i * 10 + j].title ?? "",
                        style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          itemCount: controller.categoryList.length ~/ 10, // 轮播图数量
          // 自定义分页器
          pagination: SwiperPagination(
            margin: const EdgeInsets.all(0.0), // 分页器外边距
            builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: ScreenAdapter.height(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      // Expanded 是 占满剩余空间
                      Expanded(
                        child: Align(
                          alignment: Alignment.center, // 居中
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12, // 分页器颜色
                            activeColor:
                                Color.fromARGB(137, 121, 43, 43), // 选中颜色
                          ).build(context, config),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // 热销甄选
  Widget _bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.height(40),
            ScreenAdapter.width(30),
            ScreenAdapter.height(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴对齐方式
            crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴对齐方式
            children: [
              Text(
                "热销甄选",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(46),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "更多手机 >",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(38),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(20),
            0,
            ScreenAdapter.width(20),
            ScreenAdapter.height(20),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Swiper(
                      itemBuilder: (context, index) {
                        return Image.network(
                          "https://xiaomi.itying.com/${controller.bestSellingSwiperList[index].pic}",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount:
                          controller.bestSellingSwiperList.length, // 轮播图数量
                      autoplay: true, // 自动轮播
                      loop: true, // 无限轮播模式开关
                      pagination: SwiperPagination(
                        margin: const EdgeInsets.all(0),
                        builder: SwiperCustomPagination(
                          builder: (BuildContext context,
                              SwiperPluginConfig config) {
                            return ConstrainedBox(
                              constraints: BoxConstraints.expand(
                                height: ScreenAdapter.height(36),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: const RectSwiperPaginationBuilder(
                                        color: Colors.black12,
                                        activeColor: Colors.black54,
                                      ).build(context, config),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ScreenAdapter.width(20),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.height(738),
                  child: Obx(
                    () => Column(
                      children:
                          controller.sellingPlist.asMap().entries.map((entrie) {
                        var value = entrie.value;
                        var picUrl = "https://xiaomi.itying.com/${value.pic}";
                        return Expanded(
                          flex: 1,
                          child: Container(
                            color: const Color.fromRGBO(246, 246, 246, 1),
                            margin: EdgeInsets.fromLTRB(0, 0, 0,
                                entrie.key == 2 ? 0 : ScreenAdapter.height(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: ScreenAdapter.height(20),
                                      ),
                                      Text(
                                        "${value.title}",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(38),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: ScreenAdapter.height(20),
                                      ),
                                      Text(
                                        "${value.subTitle}",
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(28),
                                        ),
                                      ),
                                      SizedBox(
                                        height: ScreenAdapter.height(20),
                                      ),
                                      Text(
                                        "￥${value.price}元",
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      ScreenAdapter.height(8),
                                    ),
                                    child: Image.network(
                                        picUrl.replaceAll("\\", "/"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 省心优惠 瀑布流
  Widget _bestGoods() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30),
              ScreenAdapter.height(40),
              ScreenAdapter.width(30),
              ScreenAdapter.height(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("省心优惠",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenAdapter.fontSize(46))),
              Text("全部优惠 >",
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
            ],
          ),
        ),
        Obx(
          () => Container(
            padding: EdgeInsets.all(ScreenAdapter.width(26)),
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: MasonryGridView.count(
              crossAxisCount: 2, // 列数
              mainAxisSpacing: ScreenAdapter.width(26), // 行间距
              crossAxisSpacing: ScreenAdapter.width(26), // 列间距
              itemCount: controller.bestPlist.length, //数量
              shrinkWrap: true, // 收缩，让元素宽度自适应
              physics:
                  const NeverScrollableScrollPhysics(), // 禁止滑动 （因为外部已经用了 ListView ）
              itemBuilder: (context, index) {
                var picUrl =
                    "https://miapp.itying.com/${controller.bestPlist[index].sPic}";
                return Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Image.network(
                          picUrl.replaceAll("\\", "/"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        width: double.infinity,
                        child: Text(
                          "${controller.bestPlist[index].title}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(42),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        width: double.infinity,
                        child: Text(
                          "${controller.bestPlist[index].subTitle}",
                          textAlign: TextAlign.start,
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        width: double.infinity,
                        child: Text(
                          "¥${controller.bestPlist[index].price}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  // 首页内容区域
  Widget _homePage() {
    return Positioned(
      top: -ScreenAdapter.height(160),
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController, // 绑定滚动控制器
        children: [
          _focus(),
          _xiaomiBanner(),
          _category(),
          _adBanner(),
          _bestSelling(),
          _bestGoods(),
          SizedBox(
            height: ScreenAdapter.height(100),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            _homePage(),
            HomeAppBar(flag: controller.flag),
          ],
        ),
      ),
    );
  }
}
