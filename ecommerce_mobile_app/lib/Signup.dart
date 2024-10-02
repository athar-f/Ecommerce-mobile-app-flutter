// ignore_for_file: dead_code, prefer_const_constructors, use_build_context_synchronously

// import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_mobile_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.title});

  final String title;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcont = TextEditingController();
    TextEditingController passcont = TextEditingController();
    bool passvisibility = false;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,),
              child: Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5, left: 20,  bottom: 30),
              child: Text(
                'Signup to Continue...!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: emailcont,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        
                      });
                    },icon:Icon(Icons.cancel),),
                    hintText: 'Enter Your Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passcont,
                obscureText: passvisibility,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(passvisibility
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          passvisibility = !passvisibility;
                        });
                      },
                    ),
                    hintText: 'Enter Your Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      String email = emailcont.text.trim();
                      String password = passcont.text;
                      try {
                          FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        auth.currentUser?.sendEmailVerification(ActionCodeSettings(
                            url:
                                ''));


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(title: ''),
                            ));
                      } catch (e) {
                        print('Something wents wrong$e');
                      }
                    },
                    child: Center(child: Text('Signin'))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an Account'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(title: ''),
                          ));
                    },
                    child: Text('Login')),
              ],
            )
          ]),
    );
  }
}
