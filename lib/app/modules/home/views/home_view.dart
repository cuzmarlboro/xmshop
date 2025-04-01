import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../controllers/home_controller.dart';

import '../../../services/keepAliveWrapper.dart';
import '../../../services/IconFont.dart';
import '../../../services/screenAdapter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  // 顶部导航栏
  Widget _appBar() {
    return Positioned(
      top: 0, // 顶部
      left: 0, // 左边
      right: 0, // 右边
      child: Obx(
        () => AppBar(
          leading: controller.flag.value
              ? const Text("")
              : const Icon(
                  IconFont.xiaomi,
                  color: Colors.white,
                ),
          leadingWidth: controller.flag.value
              ? ScreenAdapter.width(20)
              : ScreenAdapter.width(140),
          title: AnimatedContainer(
            width: controller.flag.value
                ? ScreenAdapter.width(800)
                : ScreenAdapter.width(620),
            height: ScreenAdapter.height(96),
            // 装饰
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 252, 243, 236), // 背景颜色
              borderRadius: BorderRadius.circular(30), // 圆角
            ),
            duration: const Duration(milliseconds: 300), // 动画时间
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴对齐，垂直居中
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34), // 左边
                    0, // 上边
                    ScreenAdapter.width(10), // 右边
                    0, // 下边
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  "手机",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(32),
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          backgroundColor:
              controller.flag.value ? Colors.white : Colors.transparent,
          elevation: 0, // 阴影
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code,
                  color: controller.flag.value ? Colors.black87 : Colors.white,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message,
                  color: controller.flag.value ? Colors.black87 : Colors.white),
            )
          ],
        ),
      ),
    );
  }

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

  // 首页内容区域
  Widget _homePage() {
    return Positioned(
      top: -ScreenAdapter.height(80),
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController, // 绑定滚动控制器
        children: [
          _focus(),
          _xiaomiBanner(),
          _category(),
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
            _appBar(),
          ],
        ),
      ),
    );
  }
}
