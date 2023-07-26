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
import 'package:task_manager_codeclause/screens/taskTile.dart';

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
                          child: TodayTask(),
                        ),
                        Container(
                          color: constApp.cLight,
                          height: constApp.heightApp * 0.3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                expansionTile(
                    text: "Tomorrow's Task",
                    text2: "Tomorrow's task are shown here",
                    onExpansionChanged: (bool expanded) {
                      ref
                          .read(expansionStateProvider.notifier)
                          .setStart(!expanded);
                    },
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: ref.watch(expansionStateProvider)
                          ? const Icon(AntDesign.circledown,
                              color: constApp.cDark)
                          : const Icon(AntDesign.closecircleo,
                              color: constApp.cBlueLight),
                    ),
                    children: [
                      taskTile(
                        start: "03:00",
                        end: "05:00",
                        switcher: Switch(value: true, onChanged: (value) {}),
                      ),
                    ]),
                const SizedBox(height: 20),
                expansionTile(
                    text: DateTime.now()
                        .add(const Duration(days: 2))
                        .toString()
                        .substring(5, 10),
                    text2: "Day after tomorrow's task are \nshown here",
                    onExpansionChanged: (bool expanded) {
                      ref
                          .read(expansionState0Provider.notifier)
                          .setStart(!expanded);
                    },
                    trailing: Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: ref.watch(expansionState0Provider)
                          ? const Icon(AntDesign.circledown,
                              color: constApp.cDark)
                          : const Icon(AntDesign.closecircleo,
                              color: constApp.cBlueLight),
                    ),
                    children: [
                      taskTile(
                        start: "03:00",
                        end: "05:00",
                        switcher: Switch(value: true, onChanged: (value) {}),
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }
}

class TodayTask extends ConsumerWidget {
  const TodayTask({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> listData = ref.read(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData.where(
        (element) => element.isCompleted == 0 && element.date!.contains(today)).toList();
    return ListView.builder(
        itemCount: todayList.length, itemBuilder: (context, index) {
          final data = todayList[index];
          return taskTile(
            title: data.title,
            color: constApp.cGreen,
            desc: data.desc,
            start: data.startTime,
            end: data.endTime,
          );
    });
  }
}
