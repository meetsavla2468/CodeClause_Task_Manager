import 'package:flutter/material.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/reusable/titles.dart';

class expansionTile extends StatelessWidget {
  const expansionTile(
      {super.key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children});

  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: constApp.cLight,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: BottomTitles(text: text, text2: text2),
          tilePadding: EdgeInsets.zero,
          childrenPadding:  EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
}
