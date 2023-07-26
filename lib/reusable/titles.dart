import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key, required this.text, required this.text2, this.clr});

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constApp.widthApp,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: constApp.cGreen,
                ),
              );
            }),
            const SizedBox(width: 15),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textWidget(
                      text: text,
                      style: appStyle(24, constApp.cDark, FontWeight.bold)),
                  const SizedBox(height: 1),
                  textWidget(
                      text: text2,
                      style: appStyle(14, constApp.cDark, FontWeight.normal))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
