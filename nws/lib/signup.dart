import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nws/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? _name, _password;

  // static Future<User?> signUpUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try{
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password:password);
  //     user = userCredential.user;
  //     password : _passwordController.text;
  //   } on FirebaseAuthException catch (e){
  //     if(e.code == "user-not-found"){
  //       print("No User Found");
  //     }
  //   }
  //   return user;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[400],
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(4),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(4),
                child: TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please input email';
                    }
                    return null;
                  },
                  onSaved: (String? name) {
                    _name = name;
                  },
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
                child: TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please input password';
                    }
                    return null;
                  },
                  onSaved: (String? pass) {
                    _password = pass;
                  },
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
                child: TextFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please input password';
                    }
                    if (_password != _confirmPasswordController) {
                      return 'Password do not match';
                    }
                    return null;
                  },
                  onSaved: (String? pass) {
                    _password = pass;
                  },
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      hintText: 'Confirm Password',
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
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) {
                          print('Created New Account');
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        });
                      },
                      child: Text(
                        "Register",
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
          ],
        )));
  }
}
