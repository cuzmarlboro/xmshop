/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-02 23:18:49
 * @LastEditTime: 2025-04-02 23:21:24
 * @FilePath: /xmshop/lib/app/modules/home/views/HomeAppBar.dart
 * @Description:
 */
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/IconFont.dart';
import '../../../services/screenAdapter.dart';

class HomeAppBar extends StatelessWidget {
  final RxBool flag; // 接收 GetX 的响应式变量

  const HomeAppBar({
    super.key,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(
        () => AppBar(
          leading: flag.value
              ? const Text("")
              : const Icon(
                  IconFont.xiaomi,
                  color: Colors.white,
                ),
          leadingWidth:
              flag.value ? ScreenAdapter.width(20) : ScreenAdapter.width(140),
          title: AnimatedContainer(
            width: flag.value
                ? ScreenAdapter.width(800)
                : ScreenAdapter.width(620),
            height: ScreenAdapter.height(96),
            decoration: BoxDecoration(
              color: const Color.fromARGB(230, 252, 243, 236),
              borderRadius: BorderRadius.circular(30),
            ),
            duration: const Duration(milliseconds: 300),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34),
                    0,
                    ScreenAdapter.width(10),
                    0,
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
          backgroundColor: flag.value ? Colors.white : Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color: flag.value ? Colors.black87 : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: flag.value ? Colors.black87 : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
