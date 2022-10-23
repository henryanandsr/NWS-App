import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nws/main_screen.dart';

import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //Initialize Firebase
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => toLog()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[400],
        body: Center(
            child: Container(
                child: Text(
          "NWS",
          style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Colors.white),
        ))));
  }
}

class toLog extends StatefulWidget {
  const toLog({Key? key}) : super(key: key);

  @override
  State<toLog> createState() => _toLogState();
}

class _toLogState extends State<toLog> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Login();
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
