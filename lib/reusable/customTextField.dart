import 'package:flutter/material.dart';
import 'package:task_manager_codeclause/reusable/appStyle.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';

class textFieldCustom extends StatelessWidget {
  const textFieldCustom(
      {super.key,
      this.keyBoardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.controller,
      this.onChanged,
      this.hintStyle});
  final TextInputType? keyBoardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: constApp.widthApp * 0.9,
      decoration: const BoxDecoration(
        color: constApp.cLight,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        keyboardType: keyBoardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appStyle(18, constApp.ctmGrey, FontWeight.w700),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconColor: constApp.cDark,
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: constApp.cRed, width: 0.5)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: constApp.cRed, width: 0.5)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: constApp.ctmGrey, width: 0.5)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: constApp.cDark, width: 0.5))),
      ),
    );
  }
}
