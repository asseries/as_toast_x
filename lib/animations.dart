// ignore_for_file: must_be_immutable

import 'package:as_toast_x/extensions.dart';
import 'package:flutter/material.dart';

enum ToastDirection { ltr, rtl, ttb, btt }

enum AnimationForce { hight, medium, light, heavy }

class AsBouncingAnimation extends StatefulWidget {
  Widget child;
  Curve? curve;
  Duration? duration;
  ToastDirection? toastDirection;
  AnimationForce? animationForce;

  AsBouncingAnimation(
      {Key? key,
      required this.child,
      this.duration,
      this.curve,
      this.toastDirection,
      this.animationForce})
      : super(key: key);

  @override
  State<AsBouncingAnimation> createState() => _AsBouncingAnimationState();
}

class _AsBouncingAnimationState extends State<AsBouncingAnimation> {
  @override
  void initState() {
    widget.toastDirection ??= ToastDirection.ltr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: widget.duration ?? 1.seconds,
        curve: widget.curve ?? Curves.bounceOut,
        tween: Tween(
            begin: setAnimationForce(widget.animationForce ?? AnimationForce.medium), end: 0.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: setAnimationType(widget.toastDirection ?? ToastDirection.ltr, value),
            child: child,
          );
        },
        child: widget.child);
  }

  Offset setAnimationType(ToastDirection animationType, double value) {
    if (animationType == ToastDirection.ltr) {
      return Offset(value * 60, 0.0);
    } else if (animationType == ToastDirection.rtl) {
      return Offset(value * (-60), 0.0);
    } else if (animationType == ToastDirection.btt) {
      return Offset(0.0, value * 60);
    } else if (animationType == ToastDirection.ttb) {
      return Offset(0.0, value * (-60));
    }
    return Offset(0.0, value * 100);
  }

  double setAnimationForce(AnimationForce animationForce) {
    if (animationForce == AnimationForce.hight) {
      return 8.0;
    } else if (animationForce == AnimationForce.light) {
      return 2.0;
    } else if (animationForce == AnimationForce.heavy) {
      return 12.0;
    } else {
      return 4.0;
    }
  }
}

///Animates the child
///
///using TweenAnimationBuilder
class AsScaleAnimation extends StatelessWidget {
  const AsScaleAnimation({
    Key? key,
    required this.child,
    this.begin = 0.4,
    this.end = 1,
    this.intervalStart = 0,
    this.intervalEnd = 1,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  ///Animate from value
  ///
  ///[default value 0.4]
  final double begin;

  ///Animate to value
  ///
  ///[default value 1]
  final double end;

  ///Animation Duration
  ///
  ///[default is 750ms]
  final Duration duration;

  ///Animation delay
  ///
  ///[default is 0]
  final double intervalStart;

  ///Animation delay
  ///
  ///[default is 1]
  final double intervalEnd;

  ///Animation Curve
  ///
  ///[default is Curves.fastOutSlowIn]
  final Curve curve;

  ///This widget will be animated
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, double? value, Widget? child) {
        return Transform.scale(
          scale: value!,
          child: child,
        );
      },
    );
  }
}

class ReversibleAnimation extends StatefulWidget {
  final Widget child;

  const ReversibleAnimation({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _ReversibleAnimation();
}

class _ReversibleAnimation extends State<ReversibleAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  final Tween<double> _tween = Tween(begin: .99, end: 1.08);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),

      vsync: this,
    );

  run();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _tween.animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)),
        child: widget.child);
  }

  void run() async {
    await _controller.forward();
    await _controller.repeat();
    // await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
