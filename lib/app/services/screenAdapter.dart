// ignore_for_file: file_names

/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-31 21:56:34
 * @LastEditTime: 2025-03-31 21:57:39
 * @FilePath: /xmshop/lib/app/services/screenAdapter.dart
 * @Description: flutter_screenutil 封装
 */
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  /// 获取适配后宽度
  static width(num v) {
    return v.w;
  }

  /// 获取适配后高度
  static height(num v) {
    return v.h;
  }

  /// 获取适配后字体大小
  static fontSize(num v) {
    return v.sp;
  }

  /// 获取屏幕宽度
  static getScreenWidth() {
    // return  ScreenUtil().screenWidth;
    return 1.sw;
  }

  /// 获取屏幕高度
  static getScreenHeight() {
    // return  ScreenUtil().screenHeight;
    return 1.sh;
  }
}
