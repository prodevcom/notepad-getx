import 'package:flutter/material.dart';

class CustomSafeScrollView extends StatelessWidget {
  const CustomSafeScrollView({
    super.key,
    this.child,
    this.center = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });
  final Widget? child;
  final bool center;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // Novo
    Widget scroll = SingleChildScrollView(child: child);
    Widget body = center ? Center(child: scroll) : scroll;

    // Original

    return SafeArea(
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}
