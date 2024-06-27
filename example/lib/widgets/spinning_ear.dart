import 'package:async_button_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class EarSpinner extends StatefulWidget {
  const EarSpinner({
    super.key,
    this.size = const Size(64, 64),
    this.duration = const Duration(milliseconds: 1000),
  });
  final Size size;
  final Duration duration;

  @override
  State<EarSpinner> createState() => _EarSpinnerState();
}

class _EarSpinnerState extends State<EarSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(_controller.value * math.pi),
        child: child,
      ),
      child: SizedBox(
        height: widget.size.height,
        width: widget.size.width,
        child: Assets.images.ear1024x1024.image(),
      ),
    );
  }
}
