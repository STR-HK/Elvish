import 'package:elvish/widgets/cupertino/cupertino_icon_button.dart';
import 'package:elvish/widgets/date_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> weekdays = ['일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Padding(
            padding: EdgeInsets.only(left: 2),
            child: Row(children: [
              Text(
                '2023년',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(' '),
              Text(
                '8월',
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            ])),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 6),
              child: Row(
                children: [
                  CupertinoIconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.calendar,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  CupertinoIconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.settings,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              )),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 0; i < 7; i++)
                        DateButton(
                          date: i.toString(),
                          weekday: weekdays[i],
                          subTextColor: Theme.of(context).colorScheme.outline,
                          dateColorOn: Theme.of(context).colorScheme.onSurface,
                          dateColorOff: Theme.of(context).colorScheme.surface,
                          backgroundColor:
                              Theme.of(context).colorScheme.onSurface,
                        )
                    ]),
              ),
              SizedBox(height: 12),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: Colors.transparent,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.2),
                  //     spreadRadius: 0,
                  //     blurRadius: 30,
                  //     offset: Offset(0, 0), // changes position of shadow
                  //   )
                  // ]
                ),
                child: (() {
                  // if (index == 0) {
                  //   return Text('0');
                  // } else if (index == 1) {
                  //   return Text('1');
                  // } else if (index == 2) {
                  //   return Text('2');
                  // } else if (index == 3) {
                  //   return Text('3');
                  // }
                }()),
              ))
            ]),
      ),
    );
  }
}
