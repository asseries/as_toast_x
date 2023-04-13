// ignore_for_file: constant_identifier_names

import 'package:as_toast_x/extensions.dart';
import 'package:as_toast_x/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animations.dart';
import 'body_animation.dart';

const materialIcons = {
  ToastType.success: Icons.check_circle_outline,
  ToastType.error: Icons.error,
  ToastType.warning: Icons.warning,
  ToastType.info: Icons.info,
  ToastType.delete: Icons.delete
};

enum ToastType { success, error, warning, info, delete, custom }
enum IconType {material,cupertino}

/// Cupertino Icons for the different types of motion toast.
const cupertinoIcons = {
  ToastType.success: CupertinoIcons.checkmark_alt_circle,
  ToastType.error: CupertinoIcons.exclamationmark_circle_fill,
  ToastType.warning: CupertinoIcons.exclamationmark_triangle_fill,
  ToastType.info: CupertinoIcons.info_circle_fill,
  ToastType.delete: CupertinoIcons.clear_circled,
};

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

void asToastX(BuildContext context, {
  //Any widget
  required Text child,

  //Specify whether the icon is visible or not, default true
  bool? isVisibleIcon = true,

  //Dialog types:
  // DialogType.SUCCESS,
  // DialogType.WARNING,
  // DialogType.ERROR, DEFAULT SUCCESS
  ToastType? toastType = ToastType.success,

  //BLUR RADIUS
  double? blurRadius =3.0,

  // BACKGROUND COLOR
  Color? backgroundColor,

  //Specify where the dialog opens
  ShowingPosition? showingPosition = ShowingPosition.TOP,


  // AnimationType.topToBottom
  // AnimationType.bottomToTop
  // AnimationType.rightToLeft
  // AnimationType.leftToRight
  ToastDirection? toastDirection = ToastDirection.ttb,

  //Setting dialog jump ability
  AnimationForce? animationForce,

  //Animation time
  Duration? duration,

  //Animation type
  Curve? curve = Curves.elasticOut,
  //Border radius default 56
  BorderRadius? borderRadius,

  //Icon Type
  IconType? iconType = IconType.cupertino,

  // Blur Mode
  BlurMode? blurMode,
}) async {
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry notifyHead;
  notifyHead = OverlayEntry(builder: (context) {
    backgroundColor ??= Colors.black.withOpacity(.2);
    duration ??= 1000.milliseconds;
    animationForce ??=
    (showingPosition == ShowingPosition.BOTTOM || toastDirection == ToastDirection.btt)
        ? AnimationForce.heavy
        : AnimationForce.light;
    return Positioned(
      left: MediaQuery
          .of(context)
          .size
          .width * 0.05,
      top: (showingPosition == ShowingPosition.TOP)
          ? MediaQuery
          .of(context)
          .size
          .height * (isLandscape(context) ? 0.08 : 0.05)
          : (showingPosition == ShowingPosition.CENTER)
          ? MediaQuery
          .of(context)
          .size
          .height * .9 / 2
          : MediaQuery
          .of(context)
          .size
          .height * (!isLandscape(context) ? 0.9 : .8),
      child: AsBouncingAnimation(
        curve: curve,
        animationForce: animationForce,
        toastDirection: toastDirection,
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
                child: AsScaleAnimation(
                  duration: 1000.milliseconds,
                  child:  ReversibleAnimation(child: Container(
                    margin: borderRadius != null ? const EdgeInsets.all(8) : EdgeInsets.all(12),
                    child: Icon(
                        iconType==IconType.material?materialIcons[toastType]:cupertinoIcons[toastType],
                        size: 32,
                        color: (toastType == ToastType.success)
                            ? Colors.greenAccent
                            : (toastType == ToastType.error)
                            ? Colors.red
                            : (toastType == ToastType.warning)
                            ? Colors.orange
                            : (toastType == ToastType.info)
                            ? Colors.blueAccent
                            : (toastType == ToastType.delete)
                            ? Colors.redAccent:Colors.transparent
                    ),
                  ),)
                )
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
