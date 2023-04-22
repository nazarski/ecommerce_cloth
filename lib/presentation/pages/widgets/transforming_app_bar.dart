import 'package:flutter/material.dart';

import 'transforming_app_bar_content.dart';

class TransformingAppBar extends SliverPersistentHeaderDelegate {
  const TransformingAppBar({
    required this.expandedHeight,
    required this.title,
  required this.ifPop,
  });

  final double expandedHeight;
  final String title;
final bool ifPop;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / maxExtent;

    return TransformingAppBarContent(
      progress: progress,
      title: title, ifPop: ifPop,
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
