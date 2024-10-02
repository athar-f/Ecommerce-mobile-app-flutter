import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forget_pass extends StatefulWidget {
  const Forget_pass({super.key});

  @override
  State<Forget_pass> createState() => _Forget_passState();
}

class _Forget_passState extends State<Forget_pass> {
  final emailcount= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text(
          'Forget Password',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailcount,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.cancel),
                hintText: 'Enter Your Email',
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    String email = emailcount.text.trim();
                    try {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email,
                          actionCodeSettings: ActionCodeSettings(
                              url:
                                  'https://vegetables-eecaa.firebaseapp.com/__/auth/action?mode=action&oobCode=code'));
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: "Email has been sent",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          webPosition: "center",
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } catch (e) {
                      print('Error$e');
                    }
                  },
                  child: Text('Forget password')),
            ),
          ],
        ),
      ),
);
  }
}