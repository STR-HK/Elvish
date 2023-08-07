import 'package:elvish/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class CupertinoIconButton extends StatefulWidget {
  CupertinoIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.color});
  final VoidCallback? onPressed;
  final Icon icon;
  Color color;

  @override
  State<CupertinoIconButton> createState() => _CupertinoIconButtonState();
}

class _CupertinoIconButtonState extends State<CupertinoIconButton>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 150), //controll animation duration
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    initAnime();
  }

  void initAnime() {
    animation = ColorTween(
      begin: widget.color,
      end: HSLColor.fromColor(widget.color)
          .withAlpha(
            platformBrightness == Brightness.light ? 0.1 : 0.4,
          )
          .toColor(),
    ).animate(
        new CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    Future.delayed(Duration(milliseconds: 150), () {
      controller.reverse();
      initAnime();
    });
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: IconButton(
        onPressed: () {},
        icon: widget.icon,
        color: animation.value,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          controller.forward();
        });
        widget.onPressed!();
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          Future.delayed(Duration(milliseconds: 50), () {
            controller.reverse();
          });
        });
      },
      onPointerCancel: (event) {
        setState(() {
          Future.delayed(Duration(milliseconds: 50), () {
            controller.reverse();
          });
        });
      },
    );
  }
}
