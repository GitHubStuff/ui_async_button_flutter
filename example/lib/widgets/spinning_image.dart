import 'package:async_button_demo/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
    this.size = const Size(64, 64),
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Assets.images.appLogo.image(),
    );
  }
}

class EarImage extends StatelessWidget {
  const EarImage({
    super.key,
    this.size = const Size(64, 64),
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Assets.images.ear1024x1024.image(),
    );
  }
}

class SpinngingImage extends StatefulWidget {
  const SpinngingImage({
    super.key,
    required this.spinningWidget,
    this.size = const Size(64, 64),
    this.duration = const Duration(milliseconds: 1500),
  });
  final Widget spinningWidget;
  final Size size;
  final Duration duration;

  @override
  State<SpinngingImage> createState() => _SpinngingImageState();
}

class _SpinngingImageState extends State<SpinngingImage>
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
      child: widget.spinningWidget,
    );
  }
}
