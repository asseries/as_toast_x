// ignore_for_file: constant_identifier_names

import 'package:as_toast_x/extensions.dart';
import 'package:as_toast_x/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'animations.dart';
import 'body_animation.dart';

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

void asToastX(BuildContext context,{
  //Any widget
  required Text child,

  //Specify whether the icon is visible or not, default true
  bool? isVisibleIcon,

  //Dialog types:
  // DialogType.SUCCESS,
  // DialogType.WARNING,
  // DialogType.ERROR, DEFAULT SUCCESS
  DialogType? dialogType = DialogType.SUCCESS,

  //BLUR RADIUS
  double? blurRadius,

  // BACKGROUND COLOR
  Color? backgroundColor,

  //Specify where the dialog opens
  ShowingPosition? showingPosition,


  // AnimationType.topToBottom
  // AnimationType.bottomToTop
  // AnimationType.rightToLeft
  // AnimationType.leftToRight
  AnimationType? animationType,

  //Setting dialog jump ability
  AnimationForce? animationForce,

  //Animation time
  Duration? duration,

  //Animation type
  Curve? curve,
  //Border radius default 56
  BorderRadius? borderRadius,

  // Blur Mode
  BlurMode? blurMode,
}) async {
  dialogType ??= DialogType.SUCCESS;
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
          ? MediaQuery.of(context).size.height * (isLandscape(context) ? 0.08 : 0.05)
          : (showingPosition == ShowingPosition.CENTER)
              ? MediaQuery.of(context).size.height * .9 / 2
              : MediaQuery.of(context).size.height * (!isLandscape(context) ? 0.9 : .8),
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
                borderRadius: borderRadius,
                blurMode: blurMode ?? BlurMode.SRC,
                child: child,
              ),
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
