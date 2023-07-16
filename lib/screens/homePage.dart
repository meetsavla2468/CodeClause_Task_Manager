import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/customTextField.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                        text: "Dashboard",
                        style: appStyle(18, constApp.cLight, FontWeight.bold)),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: constApp.cLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add, color: constApp.cDark),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              textFieldCustom(
                hintText: "Search",
                controller: search,
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(AntDesign.search1,
                        color: constApp.cGreyLight),
                  ),
                ),
                suffixIcon:
                    const Icon(FontAwesome.sliders, color: constApp.cGreyLight),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
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
