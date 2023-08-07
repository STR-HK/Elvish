import 'package:elvish/widgets/cupertino/cupertino_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class DateButton extends StatefulWidget {
  DateButton({
    super.key,
    required this.subTextColor,
    required this.dateColorOn,
    required this.dateColorOff,
    required this.backgroundColor,
    required this.weekday,
    required this.date,
  });
  Color subTextColor;
  Color dateColorOn;
  Color dateColorOff;
  Color backgroundColor;
  String weekday;
  String date;

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController clickController;
  late AnimationController toogleController;
  late Animation subTextAnimation;
  late Animation dateTextAnimation;
  late Animation backgroundColorAnimation;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    clickController = AnimationController(
      duration: Duration(milliseconds: 150), //controll animation duration
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    toogleController = AnimationController(
      duration: Duration(milliseconds: 200), //controll animation duration
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    initAnime();
  }

  void initAnime() {
    subTextAnimation = ColorTween(
      begin: widget.subTextColor,
      end: HSLColor.fromColor(widget.subTextColor).withAlpha(0.7).toColor(),
    ).animate(new CurvedAnimation(
        parent: clickController, curve: Curves.easeOutExpo));
    dateTextAnimation = ColorTween(
      begin: widget.dateColorOn,
      end: widget.dateColorOff,
    ).animate(new CurvedAnimation(
        parent: toogleController, curve: Curves.easeOutExpo));
    backgroundColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: widget.backgroundColor,
    ).animate(new CurvedAnimation(
        parent: toogleController, curve: Curves.easeOutExpo));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    clickController.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    Future.delayed(Duration(milliseconds: 150), () {
      clickController.reverse();
      initAnime();
    });
    Future.delayed(Duration(milliseconds: 200), () {
      toogleController.reverse();
      initAnime();
    });
    super.didChangePlatformBrightness();
  }

  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {},
          icon: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                widget.weekday,
                style: TextStyle(fontSize: 11, color: subTextAnimation.value),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColorAnimation.value,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.date,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: dateTextAnimation.value),
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.alarm,
                size: 11,
              ),
            ],
          )),
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          clickController.forward();
          if (state == false) {
            toogleController.forward();
          } else {
            toogleController.reverse();
          }
          state = !state;
        });
        // widget.onPressed!();
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          Future.delayed(Duration(milliseconds: 50), () {
            clickController.reverse();
          });
        });
      },
      onPointerCancel: (event) {
        setState(() {
          Future.delayed(Duration(milliseconds: 50), () {
            clickController.reverse();
          });
        });
      },
    );
  }
}
