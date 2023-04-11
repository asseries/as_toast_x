# [as_toast_x](https://pub.dev/packages/as_toast_x)


Toast Library for Flutter

## Toast with no context

> Supported Platforms

>
>  - Android
>  - iOS
>  - Windows
>  - Linux
>  - MacOS
>  - Web

## GIF

![DEMO](doc/gif.gif)


## How to Use

```yaml
# add this line to your dependencies
as_toast_x: ^1.0.6
```

```dart
import 'package:as_toast_x/as_toast_x.dart';
```


```dart
// ignore_for_file: library_private_types_in_public_api

// ignore_for_file: library_private_types_in_public_api

import 'package:as_toast_x/animations.dart';
import 'package:as_toast_x/as_toast_x.dart';
import 'package:as_toast_x/extensions.dart';
import 'package:as_toast_x/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/fon.png",
              fit: BoxFit.fitHeight,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            blurMode: BlurMode.COLORDOGLE,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("SUCCESS")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            child: Text("Internet tarmog'ini tekshiring!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                            dialogType: DialogType.WARNING,
                          );
                        }, child: const Text("WARNING")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            child: Text(
                              "Login yoki parol xato!",
                              style: asTextStyle(
                                  size: 16, color: Colors.white, fontWeight: FontWeight.w800),
                            ),
                            dialogType: DialogType.ERROR,
                          );
                        }, child: const Text("ERROR")),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            animationType: AnimationType.leftToRight,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("LEFT TO RIGHT ")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            animationType: AnimationType.rightToLeft,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("RIGHT TO LEFT")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            animationType: AnimationType.bottomToTop,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("BOTTOM TO TOP")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.easeInOutCirc,
                            showingPosition: ShowingPosition.TOP,
                            child: Text("Internet tarmog'ini tekshiring!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                            dialogType: DialogType.WARNING,
                          );
                        }, child: Text("OutCirc TOP".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.easeInOutCirc,
                            showingPosition: ShowingPosition.CENTER,
                            child: Text("Internet tarmog'ini tekshiring!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                            dialogType: DialogType.WARNING,
                          );
                        }, child: Text("OutCirc CENTER".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.easeInOutCirc,
                            showingPosition: ShowingPosition.BOTTOM,
                            child: Text("Internet tarmog'ini tekshiring!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                            dialogType: DialogType.WARNING,
                          );
                        }, child: Text("OutCirc BOTTOM".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            child: Text(
                                "Qabul qilindi Qabul qilindi Qabul qilindi Qabul qilindi Qabul qilindi !",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("LONG LENGTH")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(context,
                              duration: 2000.milliseconds,
                              child: Text("Internet tarmog'ini tekshiring!",
                                  style: asTextStyle(
                                      size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                              dialogType: DialogType.WARNING,
                              blurMode: BlurMode.DIFFERENCE);
                        }, child: const Text("2 SECOND")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              "Login yoki parol xato!",
                              style: asTextStyle(
                                  size: 16, color: Colors.white, fontWeight: FontWeight.w800),
                            ),
                            dialogType: DialogType.ERROR,
                            curve: Curves.fastOutSlowIn,
                          );
                        }, child: const Text("BLUE BACKGROUND")),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.easeOutBack,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: Text("EASY OUTBACK".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.bounceInOut,
                            showingPosition: ShowingPosition.TOP,
                            animationType: AnimationType.rightToLeft,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: Text("bounce In Out".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.elasticIn,
                            animationType: AnimationType.bottomToTop,
                            child: Text("Qabul qilindi!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: Text("elastic in".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            curve: Curves.easeInSine,
                            showingPosition: ShowingPosition.BOTTOM,
                            duration: 300.milliseconds,
                            animationForce: AnimationForce.hight,
                            child: Text("Internet tarmog'ini tekshiring!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                            dialogType: DialogType.WARNING,
                          );
                        }, child: Text("ease In Sine".toUpperCase())),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


```

