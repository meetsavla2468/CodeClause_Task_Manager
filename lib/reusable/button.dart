import 'package:flutter/material.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class buttonReusable extends StatelessWidget {
  const buttonReusable(
      {super.key,
      this.onTap,
      required this.width,
      required this.height,
      this.color2,
      required this.color,
      required this.text});

  final void Function()? onTap;
  final double width;
  final double height;
  final Color color;
  final Color? color2;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1, color: color)),
          child: Center(
            child: textWidget(
                text: text, style: appStyle(18, color, FontWeight.bold)),
          ),
        ));
  }
}
