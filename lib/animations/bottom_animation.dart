import 'dart:async';

import 'package:flutter/material.dart';

class Animator extends StatefulWidget {
  const Animator(
    Key? key,
    this.child,
    this.time,
  ) : super(key: key);
  final Widget? child;
  final Duration? time;

  @override
  State<Animator> createState() => _AnimatorState();
}

class _AnimatorState extends State<Animator>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    timer = Timer(widget.time!, animationController!.forward);
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation!.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation!.value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}

Timer? timer;
Duration duration = const Duration();

wait() {
  // kode ini digunakan untuk mengatur waktu tunggu (delay) dengan menggunakan objek Timer dan menghitung total durasi yang telah berlalu dengan menggunakan objek Duration
  if (timer == null || !timer!.isActive) {
    timer = Timer(const Duration(microseconds: 220), () {});
  }
  duration += const Duration(milliseconds: 200);
  return duration;
}

class WidgetAnimator extends StatelessWidget {
  const WidgetAnimator({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Animator(key, child, wait());
  }
}
