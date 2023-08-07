import 'package:elvish/widgets/cupertino/cupertino_icon_button.dart';
import 'package:elvish/widgets/date_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
                '사용자',
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
                      CupertinoIcons.person,
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
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
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
