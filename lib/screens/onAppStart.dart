import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';
import 'package:task_manager_codeclause/screens/pageOne.dart';
import 'package:task_manager_codeclause/screens/pageTwo.dart';

class onAppStart extends StatefulWidget {
  const onAppStart({super.key});

  @override
  State<onAppStart> createState() => _onAppStartState();
}

class _onAppStartState extends State<onAppStart> {
  final PageController onboardingScreenController = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    onboardingScreenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: onboardingScreenController,
            children: const [
              pageOne(),
              pageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: const Icon(Ionicons.chevron_forward_circle,
                        size: 30, color: constApp.cLight),
                  ),
                  const SizedBox(width: 5),
                  textWidget(
                      text: "Skip",
                      style: appStyle(16, constApp.cLight, FontWeight.w500)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
