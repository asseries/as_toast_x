import 'package:as_toast_x/as_toast_x.dart';
import 'package:flutter/material.dart';

import 'animations.dart';
import 'utils.dart';

void showError(BuildContext context, String message) {
  asToastX(context,
      child: Text(
        message,
        style: asTextStyle(color: Colors.white),
      ),
      toastType: ToastType.error,
      showingPosition: ShowingPosition.CENTER,
      toastDirection: ToastDirection.ttb,
      animationForce: AnimationForce.light);
}

void showSuccess(BuildContext context, String message) {
  asToastX(context,
    child: Text(
      message,
      style: asTextStyle(color: Colors.white),
    ),
    toastType: ToastType.success,
    showingPosition: ShowingPosition.TOP,
    toastDirection: ToastDirection.ltr,);
}
void showInfo(BuildContext context, String message) {
  asToastX(context,
    child: Text(
      message,
      style: asTextStyle(color: Colors.white),
    ),
    toastType: ToastType.info,
    showingPosition: ShowingPosition.TOP,
    toastDirection: ToastDirection.rtl,);
}

void showWarning(BuildContext context, String message) {
  asToastX(context,
    child: Text(
      message,
      style: asTextStyle(color: Colors.white),
    ),
    toastType: ToastType.warning,
    showingPosition: ShowingPosition.TOP,
    toastDirection: ToastDirection.ltr,);
}