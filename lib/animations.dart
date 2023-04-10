
import 'package:as_toast_x/extensions.dart';
import 'package:flutter/material.dart';

enum AnimationType { leftToRight, rightToLeft, topToBottom, bottomToTop }

enum AnimationForce {heavy, hight, medium, light }

// ignore: must_be_immutable
class AsBouncingAnimation extends StatefulWidget {
  Widget child;
  Curve? curve;
  Duration? duration;
  AnimationType? animationType;
  AnimationForce? animationForce;

  AsBouncingAnimation(
      {Key? key,
      required this.child,
      this.duration,
      this.curve,
      this.animationType,
      this.animationForce})
      : super(key: key);

  @override
  State<AsBouncingAnimation> createState() => _AsBouncingAnimationState();
}

class _AsBouncingAnimationState extends State<AsBouncingAnimation> {
  @override
  void initState() {
    widget.animationType ??= AnimationType.leftToRight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: widget.duration ?? 1.seconds,
        curve: widget.curve ?? Curves.bounceOut,
        tween: Tween(
            begin: setAnimationForce(widget.animationForce ?? AnimationForce.medium),
            end: 0.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: setAnimationType(widget.animationType ?? AnimationType.leftToRight, value),
            child: child,
          );

        },
        child: widget.child);
  }

  Offset setAnimationType(AnimationType animationType, double value) {
    if (animationType == AnimationType.leftToRight) {
      return Offset(value * 60, 0.0);
    } else if (animationType == AnimationType.rightToLeft) {
      return Offset(value * (-60), 0.0);
    } else if (animationType == AnimationType.bottomToTop) {
      return Offset(0.0, value * 60);
    } else if (animationType == AnimationType.topToBottom) {
      return Offset(0.0, value * (-60));
    }
    return Offset(0.0, value * 100);
  }

  double setAnimationForce(AnimationForce animationForce) {
    if (animationForce == AnimationForce.hight) {
      return 8.0;
    } else if (animationForce == AnimationForce.light) {
      return 2.0;
    }  else if (animationForce == AnimationForce.heavy) {
      return 12.0;
    } else {
      return 4.0;
    }
  }
}
