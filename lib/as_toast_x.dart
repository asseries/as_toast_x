// ignore_for_file: constant_identifier_names, must_be_immutable

import 'package:as_toast_x/extensions.dart';
import 'package:as_toast_x/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'animations.dart';

enum DialogType {
  SUCCESS,
  WARNING,
  ERROR,
}

enum ShowingPosition {
  TOP,
  CENTER,
  BOTTOM,
}
enum BlurMode {
  SRCOVER(BlendMode.srcOver),
  SCREEN(BlendMode.screen),
  EXCLUSION(BlendMode.exclusion),
  SRC(BlendMode.src),
  COLORDOGLE(BlendMode.colorDodge),
  COLOR(BlendMode.color),
  DIFFERENCE(BlendMode.difference),
  COLORBURN(BlendMode.colorBurn),
  HUE(BlendMode.hue),
  MULTIPLY(BlendMode.multiply),
  OVERLAY(BlendMode.overlay);
  final BlendMode value;

  const BlurMode(this.value);
}

void asToastX(
  BuildContext context,
  Widget child, {
  bool? isVisibleIcon,
  DialogType? dialogType,
  double? blurRadius,
  Color? backgroundColor,
  ShowingPosition? showingPosition,
  AnimationType? animationType,
  AnimationForce? animationForce,
  Duration? duration,
  Curve? curve,
  BorderRadius? borderRadius,
  BlurMode? blurMode,
}) async {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry notifyHead;
  notifyHead = OverlayEntry(builder: (context) {
    isVisibleIcon ??= true;
    dialogType ??= DialogType.SUCCESS;
    blurRadius ??= 3;
    backgroundColor ??= Colors.black.withOpacity(.2);
    showingPosition ??= ShowingPosition.TOP;
    animationType ??= AnimationType.topToBottom;
    duration ??= 1000.milliseconds;
    curve ??= Curves.elasticOut;
    animationForce ??=
        (showingPosition == ShowingPosition.BOTTOM || animationType == AnimationType.bottomToTop)
            ? AnimationForce.heavy
            : AnimationForce.light;
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.05,
      top: (showingPosition == ShowingPosition.TOP)
          ? MediaQuery.of(context).size.height *(isLandscape(context)?0.08:0.05)
          : (showingPosition == ShowingPosition.CENTER)
              ? MediaQuery.of(context).size.height * .9 / 2
              : MediaQuery.of(context).size.height * (!isLandscape(context)?0.9:.8),
      child: AsBouncingAnimation(
        curve: curve,
        animationForce: animationForce,
        animationType: animationType,
        duration: duration,
        child: Card(
          margin: const EdgeInsets.all(8),
          color: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(56)),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              BodyAnimation(
                  duration: ((duration!.inMilliseconds) / 5).milliseconds,
                  isVisibleIcon: isVisibleIcon ?? true,
                  blurRadius: blurRadius ?? 3,
                  borderRadius: borderRadius, blurMode: blurMode??BlurMode.SRC,
                  child: child,),
              (isVisibleIcon ?? true)
                  ? ClipRRect(
                      borderRadius: borderRadius ?? BorderRadius.circular(56),
                      child: Container(
                        margin: borderRadius != null ? const EdgeInsets.all(8) : EdgeInsets.zero,
                        // color: (dialogType == DialogType.WARNING)
                        //     ? Colors.black
                        //     : (dialogType == DialogType.ERROR)
                        //         ? Colors.red
                        //         : Colors.transparent,
                        child: Transform.scale(
                          scale: 1.45,
                          child: Lottie.asset(
                            height: 50,
                            width: 50,
                            repeat: false,
                            fit: BoxFit.fill,
                            (dialogType == DialogType.WARNING)
                                ? "assets/json/warning.json"
                                : (dialogType == DialogType.ERROR)
                                    ? "assets/json/error.json"
                                    : "assets/json/success.json",
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  });

  overlayState.insert(notifyHead);
  await Future.delayed((isVisibleIcon ?? true) ? 3.seconds : 2.6.seconds);
  notifyHead.remove();
}

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
