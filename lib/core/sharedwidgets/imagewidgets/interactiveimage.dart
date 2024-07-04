import 'package:flutter/material.dart';

import 'commonetworkimage.dart';

class Fullimage extends StatefulWidget {
  const Fullimage({super.key, required this.url});

  final String url;

  @override
  State<Fullimage> createState() => _FullimageState();
}

class _FullimageState extends State<Fullimage>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  late AnimationController animationController;
  Animation<Matrix4>? animate;
  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() => controller.value = animate!.value);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => resetAnimation(),
      child: AspectRatio(
          aspectRatio: 9 / 16,
          child: InteractiveViewer(
              transformationController: controller,
              minScale: 0.5,
              maxScale: 8,
              child: CommonRectangularImage(url: widget.url))),
    );
  }

  void resetAnimation() {
    animate = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward(from: 0);
  }
}
