import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/models/taskModel.dart';
import 'package:task_manager_codeclause/providers/expansionProvider.dart';
import 'package:task_manager_codeclause/providers/todoProvider.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/customTextField.dart';
import 'package:task_manager_codeclause/reusable/expansionTile.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';
import 'package:task_manager_codeclause/screens/addTask.dart';
import 'package:task_manager_codeclause/screens/completedTask.dart';
import 'package:task_manager_codeclause/screens/dayAfterTomorrow.dart';
import 'package:task_manager_codeclause/screens/taskTile.dart';
import 'package:task_manager_codeclause/screens/todayTask.dart';
import 'package:task_manager_codeclause/screens/tomorrowTask.dart';

class homePage extends ConsumerStatefulWidget {
  const homePage({super.key});

  @override
  ConsumerState<homePage> createState() => _homePageState();
}

class _homePageState extends ConsumerState<homePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
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
                          style:
                              appStyle(18, constApp.cLight, FontWeight.bold)),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: const BoxDecoration(
                          color: constApp.cLight,
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => addTask()));
                          },
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
                  suffixIcon: const Icon(FontAwesome.sliders,
                      color: constApp.cGreyLight),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    const Icon(FontAwesome.tasks,
                        size: 20, color: constApp.cLight),
                    const SizedBox(width: 10),
                    textWidget(
                        text: "Today's Task",
                        style: appStyle(18, constApp.cLight, FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  decoration: const BoxDecoration(
                    color: constApp.cLight,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const BoxDecoration(
                      color: constApp.cGreyLight,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    controller: tabController,
                    labelPadding: EdgeInsets.zero,
                    isScrollable: false,
                    labelStyle:
                        appStyle(24, constApp.cBlueLight, FontWeight.w700),
                    unselectedLabelColor: constApp.cLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: constApp.widthApp * 0.5,
                          child: Center(
                            child: textWidget(
                                text: "Pending",
                                style: appStyle(
                                    16, constApp.cDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: constApp.widthApp * 0.5,
                          child: Center(
                            child: textWidget(
                                text: "Completed",
                                style: appStyle(
                                    16, constApp.cDark, FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: constApp.heightApp * 0.3,
                  width: constApp.widthApp,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                          color: constApp.cBlueLight,
                          height: constApp.heightApp * 0.3,
                          child: const TodayTask(),
                        ),
                        Container(
                          color: constApp.cLight,
                          height: constApp.heightApp * 0.3,
                          child: const completedTask(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const tomorrowTask(),
                const SizedBox(height: 20),
                const dayAfterTomorrowTask(),
              ],
            ),
          ),
        ));
  }
}
