// free for use
// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

//Determines the horizontal or vertical position of the phone
bool isLandscape(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return true;
  } else {
    return false;
  }
}

//get screen height
double getScreenHeight(context) {
  return MediaQuery.of(context).size.height;
}

//get screen width
double getScreenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//custom button
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
              backgroundColor ?? const Color.fromRGBO(212, 84, 11, 1.0)
      ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8)))),
    ),
  );
}

// custom text style
TextStyle asTextStyle(
    {String? fontFamily,
      Color? color,
      double? size,
      double? height,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      List<Shadow>? shadow,
      TextOverflow? overflow}) {
  color = color ?? Colors.black;
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

