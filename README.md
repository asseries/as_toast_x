# astoastx

![](gif.gif)


astoastx
Toast Library for Flutter

Build Checks

Now this toast library supports two kinds of toast messages one which requires BuildContext other with BuildContext

Supported Platforms

Android

How to Use
# add this line to your dependencies
astoastx: ^1.0.0

import 'package:astoastx/astoastx.dart';
Toast with Build Context (Android)
asToastX(
context,
blurMode: BlurMode.COLORDOGLE,
Text("Qabul qilindi!",
style: asTextStyle(
size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
);
