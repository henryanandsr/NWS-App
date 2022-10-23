import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nws/home.dart';
import 'package:nws/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logout() async {
    await _firebaseAuth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.red[400],
                currentIndex: 2,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withAlpha(100),
                items: [
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Home()));
                          },
                          icon: const Icon(Icons.home)),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search)),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Profile()));
                          },
                          icon: const Icon(Icons.person)),
                      label: 'Profile'),
                ],
              ),
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 70),
            Center(
                child: Image(
              image: AssetImage('assets/profile.jpg'),
              height: 150,
            )),
            SizedBox(height: 50),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
                Image(image: AssetImage('assets/fb.png'), height: 25),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Henry Anand",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
                Image(image: AssetImage('assets/instagram.png'), height: 25),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "henry_anand",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                ),
                Image(image: AssetImage('assets/twitter.png'), height: 25),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "cclarc8",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              // color: Colors.red[400],
              child: Column(
                children: [
                  Text(
                    'Deskripsi Diri',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam.',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red[400],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        minimumSize: Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Text("Edit Profile",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
            SizedBox(
              height: 15,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        minimumSize: Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      logout();
                    },
                    child: Text("Logout",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold)))),
          ],
        )));
  }
}
