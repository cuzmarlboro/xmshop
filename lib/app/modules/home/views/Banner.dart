/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-03 09:36:12
 * @LastEditTime: 2025-04-03 22:02:16
 * @FilePath: /xmshop/lib/app/modules/home/views/Banner.dart
 * @Description: 
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screenAdapter.dart';
import 'package:xmshop/app/models/focus_model.dart';

class Banner extends StatelessWidget {
  final RxList<FocusItemModel> swiperList; // 接收 GetX 的响应式变量

  const Banner({
    super.key,
    required this.swiperList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(682),
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            String picUrl =
                "https://xiaomi.itying.com/${swiperList[index].pic}";
            return Image.network(
              picUrl.replaceAll("\\", "/"),
              fit: BoxFit.fill,
            );
          },
          itemCount: swiperList.length, // 轮播图数量
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
}
