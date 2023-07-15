import 'package:flutter/material.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';

class pageOne extends StatelessWidget {
  const pageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constApp.heightApp,
      width: constApp.widthApp,
      color: constApp.cDark,
    );
  }
}
