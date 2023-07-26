import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/models/taskModel.dart';
import 'package:task_manager_codeclause/providers/datesProvider.dart';
import 'package:task_manager_codeclause/providers/todoProvider.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/button.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/customTextField.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class addTask extends ConsumerStatefulWidget {
  const addTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _addTaskState();
}

class _addTaskState extends ConsumerState<addTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(datesStateProvider);
    var scheduleStartTime = ref.watch(startTimeStateProvider);
    var scheduleEndTime = ref.watch(finishTimeStateProvider);
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: constApp.cDark,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            textFieldCustom(
                hintText: "Add title",
                controller: title,
                hintStyle: appStyle(16, constApp.cGreyLight, FontWeight.w600)),
            const SizedBox(height: 20),
            textFieldCustom(
              hintText: "Add description",
              controller: desc,
              hintStyle: appStyle(16, constApp.cGreyLight, FontWeight.w600),
            ),
            const SizedBox(height: 20),
            buttonReusable(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,

                      minTime: DateTime(date.year, date.month, date.day),
                      maxTime: DateTime(date.year+1, date.month, date.day),
                      theme: const picker.DatePickerTheme(
                          doneStyle:
                              TextStyle(color: constApp.cGreen, fontSize: 16)),
                      onConfirm: (date) {
                    ref
                        .read(datesStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                width: constApp.widthApp,
                height: 52.h,
                color: constApp.cLight,
                color2: constApp.cBlueLight,
                text: scheduleDate == ""
                    ? "Set Date"
                    : scheduleDate.substring(0, 10)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonReusable(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second),
                          maxTime: DateTime(date.year+1, date.month, date.day, 11, 59, 59),
                          onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStartTime(date.toString());
                      },
                          currentTime: DateTime.now(),
                          locale: picker.LocaleType.en);
                    },
                    width: constApp.widthApp * 0.4,
                    height: 52.h,
                    color: constApp.cLight,
                    color2: constApp.cBlueLight,
                    text: scheduleStartTime == ""
                        ? "Start Time"
                        : scheduleStartTime.substring(11, 16)),
                buttonReusable(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(date.year, date.month, date.day, date.hour, date.minute, date.second),
                          maxTime: DateTime(date.year+1, date.month, date.day, 11, 59, 59),
                          onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setFinishTime(date.toString());
                      },
                          currentTime: DateTime.now(),
                          locale: picker.LocaleType.en);
                    },
                    width: constApp.widthApp * 0.4,
                    height: 52.h,
                    color: constApp.cLight,
                    color2: constApp.cBlueLight,
                    text: scheduleEndTime == ""
                        ? "End Time"
                        : scheduleEndTime.substring(11, 16)),
              ],
            ),
            const SizedBox(height: 20),
            buttonReusable(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      scheduleStartTime.isNotEmpty &&
                      scheduleEndTime.isNotEmpty) {
                    TaskModel task = TaskModel(
                      title: title.text,
                      desc: desc.text,
                      isCompleted: 0,
                      date: scheduleDate,
                      startTime: scheduleStartTime.substring(10, 16),
                      endTime: scheduleEndTime.substring(10, 16),
                      reminder: 0,
                      repeat: "yes",
                    );
                    ref.read(todoStateProvider.notifier).addItem(task);
                    ref
                        .read(finishTimeStateProvider.notifier)
                        .setFinishTime('');
                    ref.read(startTimeStateProvider.notifier).setStartTime('');
                    ref.read(datesStateProvider.notifier).setDate('');
                    print("Task addition successful");
                    Navigator.pop(context);
                  } else {
                    print("Addition of task unsuccessful");
                  }
                },
                width: constApp.widthApp,
                height: 52.h,
                color: constApp.cLight,
                color2: constApp.cGreen,
                text: "Add Task"),
          ],
        ),
      ),
    );
  }
}
