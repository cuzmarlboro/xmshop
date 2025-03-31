import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../../../services/keepAliveWrapper.dart';
import '../../../services/IconFont.dart';
import '../../../services/screenAdapter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -ScreenAdapter.height(80),
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView.builder(
                controller: controller.scrollController, // 绑定滚动控制器
                itemCount: 20,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return SizedBox(
                      width: ScreenAdapter.width(1080),
                      height: ScreenAdapter.height(682),
                      child: Image.network(
                        "https://www.itying.com/images/focus/focus02.png",
                        fit: BoxFit.cover, // 填充
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text('item $index'),
                    );
                  }
                },
              ),
            ),
            Positioned(
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
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // 交叉轴对齐，垂直居中
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
                          color: controller.flag.value
                              ? Colors.black87
                              : Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.message,
                            color: controller.flag.value
                                ? Colors.black87
                                : Colors.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
