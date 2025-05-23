/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-30 23:17:43
 * @LastEditTime: 2025-04-04 00:03:50
 * @FilePath: /xmshop/lib/main.dart
 * @Description: 
 */
import 'package:flutter/material.dart'; // 基础组件
import 'package:flutter/services.dart'; // 系统UI

import 'package:get/get.dart'; // 状态管理

import 'app/routes/app_pages.dart'; // 路由

import 'package:flutter_screenutil/flutter_screenutil.dart'; // 屏幕适配

void main() {
  // 配置透明的状态栏
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  runApp(
    ScreenUtilInit(
      designSize: const Size(1080, 2400), // 设计稿的宽度和高度 px
      minTextAdapt: true, // 最小字体适配
      splitScreenMode: true, // 横屏适配
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false, // 隐藏 debug 标志
          title: "Application",
          initialRoute: AppPages.INITIAL,
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          defaultTransition: Transition.rightToLeft, // 配置ios动画
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
