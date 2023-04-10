
import 'package:as_toast_x/extensions.dart';
import 'package:as_toast_x/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'as_toast_x.dart';


//Animation of the second part of Toast
// ignore: must_be_immutable
class BodyAnimation extends StatefulWidget {
  final Widget child;
  bool? isVisibleIcon;
  final double blurRadius;
  Duration duration;
  BorderRadius? borderRadius;
  BlurMode blurMode;

  BodyAnimation(
      {Key? key,
      required this.child,
      this.isVisibleIcon,
      required this.blurRadius,
      required this.duration,
      required this.borderRadius,
      required this.blurMode
      })
      : super(key: key);

  @override
  State<BodyAnimation> createState() => _BodyAnimationState();
}

class _BodyAnimationState extends State<BodyAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    widget.isVisibleIcon ??= true;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });
    start();
    super.initState();
  }

  Future<void> start() async {
    _controller.forward();
    setState(() {});
    await Future.delayed(2.seconds); // _controller.reverse();
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _animation =
        Tween<double>(begin: 0.0, end: getScreenWidth(context) / 1.25).animate(_controller);
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(56),
      child: AnimatedContainer(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: (widget.isVisibleIcon ?? true) ? (widget.borderRadius != null ? 60 : 58) : 28,
        ),
        // margin: const EdgeInsets.only(
        //   left: 40,//(widget.isVisibleIcon ?? true) ? 50 : 0
        // ),
        duration: widget.duration,
        width: _animation.value * (!isLandscape(context) ? 1.08 : 1.1),
        child: BackdropFilter(
            blendMode: widget.blurMode.value,
            filter: ImageFilter.blur(sigmaX: widget.blurRadius, sigmaY: widget.blurRadius),
            child: Padding(
              padding: widget.borderRadius != null ? const EdgeInsets.all(8.0) : EdgeInsets.zero,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 16, right: (getScreenWidth(context) * .11)),
                  width: getScreenWidth(context) * .8,
                  child: Row(
                    children: [
                      Expanded(child: widget.child),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
