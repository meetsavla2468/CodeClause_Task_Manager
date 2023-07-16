import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/onAppStart.dart';
import 'package:task_manager_codeclause/screens/otpScreen.dart';
import 'package:task_manager_codeclause/screens/pageOne.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  static String verifyId = "";
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var phoneEditor = "";
  final TextEditingController countryCode = TextEditingController();
  Map<String, dynamic>? _userData;
  @override
  void initState() {
    countryCode.text = '+91';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const onAppStart()));
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
            color: constApp.cLight),
        backgroundColor: constApp.cDark,
        elevation: 2,
        automaticallyImplyLeading: false,
        titleSpacing: 50,
        titleTextStyle: const TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: constApp.cLight),
        title: const Text('Task Manager'),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25, top: 100),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/todo.png', width: 200, height: 200),
              const SizedBox(height: 40),
              const SizedBox(
                  height: 30,
                  child: Text('Phone Verification',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constApp.cLight))),
              const Text('Enter contact number to receive otp!',
                  style: TextStyle(fontSize: 18, color: constApp.cLight)),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(
                        width: 42,
                        child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: countryCode,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: const TextStyle(
                                fontSize: 20, color: constApp.cLight))),
                    const SizedBox(
                        width: 10,
                        child: Text('|',
                            style:
                                TextStyle(fontSize: 40, color: Colors.grey))),
                    const SizedBox(width: 5),
                    Expanded(
                        child: TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              phoneEditor = value;
                            },
                            style: const TextStyle(
                                fontSize: 20, color: constApp.cLight),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter mobile no.',
                                hintStyle: TextStyle(color: constApp.cLight)))),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCode.text + phoneEditor,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {
                            Fluttertoast.showToast(msg: 'Phone number verified!');
                          },
                      verificationFailed: (FirebaseAuthException e) {
                        Fluttertoast.showToast(msg: 'Error in verification');
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        loginPage.verifyId = verificationId;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => otpScreen()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'Send Otp',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
