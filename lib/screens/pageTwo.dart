import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_codeclause/reusable/button.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/loginScreen.dart';

class pageTwo extends StatelessWidget {
  const pageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constApp.heightApp,
      width: constApp.widthApp,
      color: constApp.cDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset("assets/todo.png"),
          ),
          const SizedBox(height: 50),
          buttonReusable(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              width: constApp.widthApp * 0.9,
              height: constApp.heightApp * 0.06,
              color: constApp.cLight,
              text: "Login with Phone number")
        ],
      ),
    );
  }
}
