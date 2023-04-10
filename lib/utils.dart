// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import 'app_colors.dart';

bool isLandscape(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return true;
  } else {
    return false;
  }
}

double getScreenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(context) {
  return MediaQuery.of(context).size.width;
}

Widget asButton(
    BuildContext context, {
      required Function onPressed,
      required Widget child,
      EdgeInsets? margin,
      EdgeInsets? padding,
      double? height,
      double? width,
      Alignment? alignment,
      Color? backgroundColor,
      BorderRadius? borderRadius,
      double? elevation,
    }) {
  elevation ??= 0.5;
  return Container(
    height: height,
    width: width,
    margin: margin,
    padding: padding,
    alignment: alignment,
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: child,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? AppColors.COLOR_PRIMARY),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8)))),
    ),
  );
}

TextStyle asTextStyle(
    {String? fontFamily,
      Color? color,
      double? size,
      double? height,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      List<Shadow>? shadow,
      TextOverflow? overflow}) {
  color = color ?? AppColors.BLACK;
  return TextStyle(
      fontFamily: fontFamily ?? "p_reg",
      color: color,
      fontSize: size ?? 14,
      shadows: shadow,
      overflow: overflow,
      height: height,
      fontWeight: fontWeight,
      decoration: decoration);
}

