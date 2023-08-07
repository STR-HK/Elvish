import 'package:elvish/pages/main/main_page.dart';
import 'package:elvish/pages/search/search_page.dart';
import 'package:elvish/pages/user/user_page.dart';
import 'package:elvish/widgets/cupertino/cupertino_icon_button.dart';
import 'package:elvish/widgets/date_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

void main() {
  runApp(ElvishApp());
}

var platformBrightness =
    SchedulerBinding.instance.platformDispatcher.platformBrightness;

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.light),
  useMaterial3: true,
  fontFamily: 'Pretendard',
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
);

var darkData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.dark),
  useMaterial3: true,
  fontFamily: 'Pretendard',
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
);

class ElvishApp extends StatelessWidget {
  const ElvishApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elvish',
      theme: themeData,
      darkTheme: darkData,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const RoutePage(),
    );
  }
}

class RoutePage extends StatefulWidget {
  const RoutePage({super.key});

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/1691318338737.jpg'),
      //         colorFilter: new ColorFilter.mode(
      //             Colors.white.withOpacity(0), BlendMode.dstATop),
      //         fit: BoxFit.cover)),
      child: Scaffold(
          // backgroundColor: Colors.transparent,
          body: (() {
            if (index == 0) {
              return MainPage();
            } else if (index == 1) {
              return SearchPage();
            } else if (index == 2) {
              return Text(index.toString());
            } else if (index == 3) {
              return Text(index.toString());
            } else if (index == 4) {
              return UserPage();
            } else {
              return Text(index.toString());
            }
          }()),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(4),
            child: CupertinoTabBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              border: Border.all(color: Colors.transparent),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.book), label: '일정'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search), label: '검색'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.command), label: '플래너'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.square_favorites_alt),
                    label: '통계'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person), label: '사용자'),
              ],
              onTap: (i) {
                setState(() {
                  index = i;
                });
              },
              currentIndex: index,
              iconSize: 23,
            ),
          ))),
    );
  }
}
