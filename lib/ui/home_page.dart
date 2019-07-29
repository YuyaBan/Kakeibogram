import 'dart:math';
import 'package:kakeibogram/ui/home_page_sub.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HomePageWidget(),
      ),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>{

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Kakeibogram',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'GreatVibes-Regular',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _content1(size,users[0],context),
            _content1(size,users[1],context),
            _content1(size,users[2],context),
            _content1(size,users[3],context),
            _content1(size,users[4],context),
          ],
        ),
      ),
    );
  }



}

Widget _content1(Size size, User user, BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        _area1(user, context), //ユーザ名
        _area2(size, (user.rank-1), context), //写真
        _area3(), //コメント
      ],
    ),
  );
}

Widget _area1(User user, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(5,0,5,0),
    child: Row(
      children: <Widget>[
        Container(
          child: GestureDetector(
            onTap: () => {
              Navigator.of(context).pushNamed('/user')
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(5,5,5,5),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _icons[(user.rank-1)]
                  )
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5,5,2,5),
          child: Text(
            //"hironaka",
            user.name,
            style: TextStyle(fontSize: 19),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0,5,5,5),
          child: Text(
            "@"+ user.id,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500]),
          ),
        ),
      ],
    ),
  );
}

Widget _area2(Size size, int index, BuildContext context) {
  return Container(
    margin: EdgeInsets.fromLTRB(5,0,5,0),
    width: size.width,
    child: Stack(
      children: <Widget>[
        Container(
          child: GestureDetector(
            onTap: () => {
              Navigator.of(context).pushNamed('/post_detail')
            },
            child: Image.asset("assets/images/IMAGE-1.jpeg"),
          )
        ),
        Container(
          margin: EdgeInsets.fromLTRB(200,180,0,0),
          color: Colors.white.withOpacity(0.7),
          width: 160.0,
          height: 80.0,
          child: Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      "美味しそうなケーキ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "¥2000",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _area3() {
  return Container(
    margin: EdgeInsets.fromLTRB(5,0,5,0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(5,0,5,0),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(2,0,2,0),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(2,0,2,0),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5,0,5,10),
          child: Text(
            "おしゃれなやつ出てきた。美味しかった！",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}

class User {
  const User({this.name, this.point, this.rank, this.id});

  final String name;
  final int point;
  final int rank;
  final String id;
}

const List<User> users = const <User>[
  const User(name: 'ひろなか', point: 8000, rank: 1, id: 'mhironak'),
  const User(name: 'hiro', point: 7800, rank: 2, id: 'hiropon'),
  const User(name: 'matsu', point: 6400, rank:3, id: 'matsu0322'),
  const User(name: 'sato', point: 6100, rank:4, id: 'sato0910'),
  const User(name: 'ueno', point: 5550, rank:5, id: 'uenokoen'),
  const User(name: 'karuizawa', point: 4500, rank:6, id: 'kei'),
  const User(name: 'izu', point: 3800, rank:7, id: 'izuizu'),
];

final List<AssetImage> _icons = [
    AssetImage(
      'assets/icon/icon-1.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-2.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-3.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-4.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-5.jpeg',
    ),
  ];