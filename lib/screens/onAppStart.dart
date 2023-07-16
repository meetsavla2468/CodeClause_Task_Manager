import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';
import 'package:task_manager_codeclause/screens/pageOne.dart';
import 'package:task_manager_codeclause/screens/pageTwo.dart';

import 'loginScreen.dart';

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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => loginPage()));
                        },
                        child: const Icon(Ionicons.chevron_forward_circle,
                            size: 30, color: constApp.cLight),
                      ),
                      const SizedBox(width: 5),
                      textWidget(
                          text: "Skip",
                          style:
                              appStyle(16, constApp.cLight, FontWeight.w500)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      onboardingScreenController.nextPage(
                          duration: const Duration(microseconds: 600),
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(
                      controller: onboardingScreenController,
                      count: 2,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 16,
                        spacing: 10,
                        dotColor: constApp.cYellow,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
