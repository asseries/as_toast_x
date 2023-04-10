# as_toast_x

![](gif.gif)


as_toast_x
Toast Library for Flutter

Build Checks

Now this toast library supports two kinds of toast messages one which requires BuildContext other with BuildContext

Supported Platforms

Android

How to Use
# add this line to your dependencies
as_toast_x: ^1.0.0

import 'package:as_toast_x/as_toast_x.dart';
Toast with Build Context (Android)
as_toast_x(
context,
blurMode: BlurMode.COLORDOGLE,
Text("Qabul qilindi!",
style: asTextStyle(
size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
);
