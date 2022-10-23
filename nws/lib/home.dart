import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nws/profile.dart';
import 'package:nws/services/api_service.dart';

import 'components/customlisttile.dart';
import 'model/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();

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
                currentIndex: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withAlpha(100),
                items: [
                  BottomNavigationBarItem(
                      icon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.home)),
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
        body: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.all(0),
              child: Text('Latest News',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold))),
          Padding(
              padding: EdgeInsets.all(4),
              child: Image(
                image: AssetImage('assets/home_pic.png'),
              )),
          Expanded(
            child: FutureBuilder(
              future: client.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                //let's check if we got a response or not
                ScrollDirection:
                Axis.vertical;
                shrinkWrap:
                true;
                if (snapshot.hasData) {
                  //Now let's make a list of articles
                  List<Article>? articles = snapshot.data;
                  return ListView.builder(
                    //Now let's create our custom List tile
                    itemCount: articles?.length,
                    itemBuilder: (context, index) =>
                        customListTile(articles![index], context),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ]));
  }
}
