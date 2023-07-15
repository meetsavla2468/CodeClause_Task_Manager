import 'package:flutter/material.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textWidget(
                text: "Todo",
                style: appStyle(30, constApp.cBlueLight, FontWeight.bold)),
            const SizedBox(width: 10),
            textWidget(
                text: "Todo",
                style: appStyle(30, constApp.cBlueLight, FontWeight.bold)),
            const SizedBox(width: 10),
            textWidget(
                text: "Todo",
                style: appStyle(30, constApp.cBlueLight, FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
