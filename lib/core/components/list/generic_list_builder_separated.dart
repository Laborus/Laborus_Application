import 'package:flutter/material.dart';

class GenericListBuilderSeparated extends StatelessWidget {
  final int itemCount;
  final EdgeInsets? padding;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final bool? shrinkWrap;
  final Axis? scrollDirection;
  final ScrollPhysics? physics;

  const GenericListBuilderSeparated({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.shrinkWrap,
    this.padding,
    this.scrollDirection,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: physics ?? const NeverScrollableScrollPhysics(),
      padding: padding ??
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      shrinkWrap: shrinkWrap ?? true,
      itemCount: itemCount,
      scrollDirection: scrollDirection ?? Axis.vertical,
      itemBuilder: itemBuilder,
      separatorBuilder: separatorBuilder,
    );
  }
}
