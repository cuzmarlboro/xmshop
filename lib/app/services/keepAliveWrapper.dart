// ignore_for_file: file_names

/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-03-31 20:49:55
 * @LastEditTime: 2025-03-31 20:58:38
 * @FilePath: /xmshop/lib/app/services/keepAliveWrapper.dart
 * @Description: 页面缓存 (必须在 PageView 或 TabView 中使用)
 */

import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper(
      {super.key, @required this.child, this.keepAlive = true});

  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
