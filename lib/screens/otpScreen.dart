import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/loginScreen.dart';
import 'homePage.dart';

class otpScreen extends StatefulWidget {
  const otpScreen({super.key});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var msgCode = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const loginPage()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/todo.png', width: 200, height: 200),
              const Text('Phone Verification',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: constApp.cLight)),
              const Text('Enter received otp!',
                  style: TextStyle(fontSize: 18, color: constApp.cLight)),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  msgCode = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        (PhoneAuthProvider.credential(
                            verificationId: loginPage.verifyId,
                            smsCode: msgCode));
                    await auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                    Fluttertoast.showToast(msg: 'Verification successful');
                  } catch (e) {
                    Fluttertoast.showToast(msg: 'Error in verifying Otp');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600),
                child: const Text(
                  'Verify Otp',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text("Didn't receive code ?",
                  style: TextStyle(fontSize: 15, color: Colors.blue.shade700)),
              TextButton(
                  onPressed: () {},
                  child: Text('Resend Otp',
                      style: TextStyle(color: Colors.blue.shade700)))
            ],
          ),
        ),
      ),
    );
  }
}
