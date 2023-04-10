
import 'package:astoastx/animations.dart';
import 'package:astoastx/astoastx.dart';
import 'package:astoastx/extensions.dart';
import 'package:astoastx/utils.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
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
                        Text("Qabul qilindi!",
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
                        Text("Internet tarmog'ini tekshiring!",
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
                        Text(
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
                        Text("Qabul qilindi!",
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
                        Text("Qabul qilindi!",
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
                        Text("Qabul qilindi!",
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
                        Text("Internet tarmog'ini tekshiring!",
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
                        Text("Internet tarmog'ini tekshiring!",
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
                        Text("Internet tarmog'ini tekshiring!",
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
                        Text(
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
                      asToastX(
                        context,
                        duration: 2000.milliseconds,
                        Text("Internet tarmog'ini tekshiring!",
                            style: asTextStyle(
                                size: 16, color: Colors.white, fontWeight: FontWeight.w800)),
                        dialogType: DialogType.WARNING,
                        blurMode: BlurMode.DIFFERENCE
                      );
                    }, child: const Text("2 SECOND")),
                    const SizedBox(
                      height: 8,
                    ),
                    asButton(context, margin: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                      asToastX(
                        context,
                        backgroundColor: Colors.blueAccent,
                        Text(
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
                        Text("Qabul qilindi!",
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
                        Text("Qabul qilindi!",
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
                        Text("Qabul qilindi!",
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
                        Text("Internet tarmog'ini tekshiring!",
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
