import 'package:elvish/widgets/cupertino/cupertino_icon_button.dart';
import 'package:elvish/widgets/date_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

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
                '검색',
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
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CupertinoSearchTextField(
                placeholder: '검색',
                // style: TextStyle(
                //     color: Theme.of(context).colorScheme.onSurface),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16),
                //   color: Theme.of(context).colorScheme.surface,
                // ),
                onSubmitted: (string) {
                  _showAlertDialog(context);
                },
              )
            ]),
      )),
    );
  }
}
