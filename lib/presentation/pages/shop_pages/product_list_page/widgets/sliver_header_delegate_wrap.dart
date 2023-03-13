import 'package:flutter/material.dart';

class SliverHeaderDelegateWrap extends SliverPersistentHeaderDelegate {
  const SliverHeaderDelegateWrap(
      {required this.widget, required this.widgetHeight});

  final double widgetHeight;
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => widgetHeight;

  @override
  double get minExtent => widgetHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
