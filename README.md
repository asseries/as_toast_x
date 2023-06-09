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
<p  align="center">
<img  src="https://github.com/asseries/as_toast_x/blob/main/toast.gif?raw=true"  width="350"/>
<br>
</p>




## How to Use

```yaml
# add this line to your dependencies
as_toast_x: ^1.1.2
```

```dart
import 'package:as_toast_x/as_toast_x.dart';
```


```dart
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
                            child: Text(
                              "Ma'lumotlar yuborildi",
                              style: asTextStyle(color: Colors.white, fontWeight: FontWeight.w800,size: 16),
                            ),
                            toastType: ToastType.success,
                            toastDirection: ToastDirection.ltr,
                            iconType: IconType.material,
                            // animationType: AnimationType.topToBottom,
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
                            toastType: ToastType.warning,
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
                            toastType: ToastType.error,
                          );
                        }, child: const Text("ERROR")),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            toastDirection: ToastDirection.ltr,
                            toastType: ToastType.info,
                            child: Text("Malumotlar INFO!",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("INFO")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          asToastX(
                            context,
                            toastDirection: ToastDirection.rtl,
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
                            toastType: ToastType.delete,
                            toastDirection: ToastDirection.btt,
                            child: Text("All queryies deleted",
                                style: asTextStyle(
                                    size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                          );
                        }, child: const Text("DELETE")),
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
                            toastType: ToastType.warning,
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
                            toastType: ToastType.warning,
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
                            toastType: ToastType.warning,
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
                              toastType: ToastType.warning,
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
                            toastType: ToastType.error,
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
                            toastDirection: ToastDirection.rtl,
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
                            toastDirection: ToastDirection.btt,
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
                            toastType: ToastType.warning,
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

