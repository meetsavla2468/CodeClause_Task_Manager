import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager_codeclause/reusable/constants.dart';
import 'package:task_manager_codeclause/screens/homePage.dart';
import 'package:task_manager_codeclause/screens/onAppStart.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
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
                  child: Text('Google Verification',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: constApp.cLight))),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () async {
                    await signInWithGoogle();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const homePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'Login with Google',
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

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credentials = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credentials);
  }
}
