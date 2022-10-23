import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nws/signup.dart';

import 'home.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User Found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          const Padding(
              padding: EdgeInsets.all(4),
              child: Center(
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: Colors.white)),
              )),
          Padding(
              padding: EdgeInsets.all(4),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    hintText: 'Username',
                    fillColor: Colors.white,
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: 'Poppins')),
              )),
          Padding(
              padding: EdgeInsets.all(4),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    hintText: 'Password',
                    fillColor: Colors.white,
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: 'Poppins')),
              )),
          Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                width: double.infinity,
                child: OutlinedButton(
                    // fillColor: Colors.red[400],
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(width: 1, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account?",
                style: TextStyle(
                    fontFamily: 'Poppins', fontSize: 12, color: Colors.white),
              ),
              SingleChildScrollView(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: 'Poppins'),
                    )
                    // }
                    ),
              )
            ],
          )
        ]));
  }
}
