import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/textWidgets.dart';

class taskTile extends StatelessWidget {
  const taskTile(
      {super.key,
      this.color,
      this.title,
      this.desc,
      this.start,
      this.end,
      this.editWidgetIcon,
      this.delete, this.switcher});
  final Color? color;
  final String? title;
  final String? desc;
  final String? start;
  final String? end;
  final Widget? editWidgetIcon;
  final Widget? switcher;
  final void Function()? delete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: constApp.widthApp,
            decoration: const BoxDecoration(
              color: constApp.cGreyLight,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: color ?? constApp.cRed,
                  ),
                ),
                const SizedBox(width: 15),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    width: constApp.widthApp*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                            text: title ?? "Title",
                            style:
                                appStyle(18, constApp.cLight, FontWeight.bold)),
                        const SizedBox(height: 3),
                        textWidget(
                            text: desc ?? "Description of Task",
                            style:
                                appStyle(12, constApp.cLight, FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: constApp.widthApp * 0.3,
                              height: 25.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.3,
                                  color: constApp.cDark,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: constApp.cDark,
                              ),
                              child: Center(
                                  child: textWidget(
                                      text: "$start | $end",
                                      style: appStyle(12, constApp.cLight,
                                          FontWeight.normal))),
                            ),
                            const SizedBox(width: 20),
                            Row(
                              children: [
                                SizedBox(
                                  child: editWidgetIcon,
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: delete,
                                  child: const Icon(
                                      MaterialCommunityIcons.delete_circle),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
