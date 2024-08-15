import 'package:flutter/material.dart';

import 'loading.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    super.key,
    required this.emptyIcon,
    required this.emptyText,
    required this.itemCount,
    required this.separatorBuilder,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.isLoading = false,
    this.controller,
    this.padding,
    this.backgroundColor,
  });

  final IconData emptyIcon;
  final String emptyText;
  final int itemCount;
  final ScrollController? controller;
  final IndexedWidgetBuilder separatorBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final bool isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
          color: backgroundColor ?? Colors.transparent, child: const Loading());
    }
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (itemCount == 0)
            const Padding(
              padding: EdgeInsets.all(0),
              child: SizedBox(),
            ),
          ListView.separated(
              physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              shrinkWrap: shrinkWrap,
              controller: controller,
              padding: padding,
              itemBuilder: itemBuilder,
              separatorBuilder: separatorBuilder,
              itemCount: itemCount),
        ],
      ),
    );
  }
}
