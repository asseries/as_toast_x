// ignore_for_file: must_be_immutable, library_private_types_in_public_api, deprecated_member_use

import 'package:as_toast_x/extensions.dart';
import 'package:flutter/material.dart';

enum AnimationType { leftToRight, rightToLeft, topToBottom, bottomToTop }

enum AnimationForce {heavy, hight, medium, light }

class AsBouncingAnimation extends StatefulWidget {
  Widget child;
  Curve? curve;
  Duration? duration;
  AnimationType? animationType;
  AnimationForce? animationForce;

  AsBouncingAnimation(
      {Key? key,
      required this.child,
      this.duration,
      this.curve,
      this.animationType,
      this.animationForce})
      : super(key: key);

  @override
  State<AsBouncingAnimation> createState() => _AsBouncingAnimationState();
}

class _AsBouncingAnimationState extends State<AsBouncingAnimation> {
  @override
  void initState() {
    widget.animationType ??= AnimationType.leftToRight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: widget.duration ?? 1.seconds,
        curve: widget.curve ?? Curves.bounceOut,
        tween: Tween(
            begin: setAnimationForce(widget.animationForce ?? AnimationForce.medium),
            end: 0.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: setAnimationType(widget.animationType ?? AnimationType.leftToRight, value),
            child: child,
          );

        },
        child: widget.child);
  }

  Offset setAnimationType(AnimationType animationType, double value) {
    if (animationType == AnimationType.leftToRight) {
      return Offset(value * 60, 0.0);
    } else if (animationType == AnimationType.rightToLeft) {
      return Offset(value * (-60), 0.0);
    } else if (animationType == AnimationType.bottomToTop) {
      return Offset(0.0, value * 60);
    } else if (animationType == AnimationType.topToBottom) {
      return Offset(0.0, value * (-60));
    }
    return Offset(0.0, value * 100);
  }

  double setAnimationForce(AnimationForce animationForce) {
    if (animationForce == AnimationForce.hight) {
      return 8.0;
    } else if (animationForce == AnimationForce.light) {
      return 2.0;
    }  else if (animationForce == AnimationForce.heavy) {
      return 12.0;
    } else {
      return 4.0;
    }
  }
}

///Animates the child
///
///using TweenAnimationBuilder
class AsScaleAnimation extends StatelessWidget {
  const AsScaleAnimation({
    Key? key,
    required this.child,
    this.begin = 0.4,
    this.end = 1,
    this.intervalStart = 0,
    this.intervalEnd = 1,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final double begin;
  final double end;
  final Duration duration;
  final double intervalStart;
  final double intervalEnd;
  final Curve curve;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, double? value, Widget? child) {
        return Transform.scale(
          scale: value!,
          child: child,
        );
      },
    );
  }
}

class AsAnimationWidth extends StatefulWidget {
  const AsAnimationWidth({Key? key}) : super(key: key);

  @override
  State<AsAnimationWidth> createState() => _AsAnimationWidthState();
}

class _AsAnimationWidthState extends State<AsAnimationWidth> with SingleTickerProviderStateMixin {
  double _width = 0.0;
  final _color = Colors.blue;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(500.milliseconds);
      setState(()  {
        _width = 250;
      });
      await Future.delayed(2000.milliseconds);
      // this.dispose();
      setState(()  {
        _width = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.316,),
      Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.height * 0.08,),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AnimatedSize(
              curve: Curves.fastOutSlowIn,
              vsync: this,
              duration: const Duration(seconds: 1),
              child: Container(
                decoration: BoxDecoration(
                  color: _color,
                ),
                width: _width,
                height: 50,
              ),
            ),
          ),
        ],
      ),
      const Divider(
        height: 35.0,
      ),
    ]);
  }
}




class ExpandedSection extends StatefulWidget {

  final Widget child;
  final bool expand;
  const ExpandedSection({super.key, this.expand = false, required this.child});

  @override
  _ExpandedSectionState createState() {
    return _ExpandedSectionState();
  }
}

class _ExpandedSectionState extends State<ExpandedSection> with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if(widget.expand) {
      expandController.forward();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child
    );
  }
}