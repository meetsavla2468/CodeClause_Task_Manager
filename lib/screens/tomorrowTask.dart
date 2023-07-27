import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager_codeclause/providers/todoProvider.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/taskTile.dart';
import '../providers/expansionProvider.dart';
import '../reusable/expansionTile.dart';

class tomorrowTask extends ConsumerWidget {
  const tomorrowTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    final color = ref.read(todoStateProvider.notifier).getRandomColor();
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
    var tomorrowTasks = todos.where((element) => element.date!.contains(tomorrow));
    return expansionTile(
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
          for(final todo in tomorrowTasks)
            taskTile(
              delete: () {
                ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
              },
              editWidgetIcon: GestureDetector(
                onTap: () {},
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              ),
              title: todo.title,
              desc: todo.desc,
              color: color,
              start: todo.startTime,
              end: todo.endTime,
              switcher: const SizedBox.shrink(),
            ),
        ]);
  }
}
