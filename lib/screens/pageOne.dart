import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class pageOne extends StatelessWidget {
  const pageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constApp.heightApp,
      width: constApp.widthApp,
      color: constApp.cDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/todo.png"),
          ),
          const SizedBox(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textWidget(
                  text: "ToDo with RiverPod",
                  style: appStyle(30, constApp.cLight, FontWeight.w600)),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                    "Welcome!! Do you want to create a task with ease?",
                    textAlign : TextAlign.center,
                    style: appStyle(16, constApp.cGreyLight, FontWeight.normal)),
              )
            ],
          )
        ],
      ),
    );
  }
}
