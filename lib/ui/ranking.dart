import 'dart:math';

import 'package:flutter/material.dart';

import '../theme.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RankingWidget(),
      ),
    );
  }
}

class RankingWidget extends StatefulWidget {
  @override
  _RankingWidgetState createState() => _RankingWidgetState();
}

class _RankingWidgetState extends State<RankingWidget> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: new Text(
          'Kakeibogram',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'GreatVibes-Regular',
          ),
        ),
            bottom: TabBar(
              //labelColor: Colors.white,
              tabs: choices.map((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Ranking(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.text, this.point, this.rank});

  final String title;
  final String text;
  final int point;
  final int rank;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'フォロー中', text: 'sato'', point: 2000, rank: 1),
  const Choice(title: 'ALL', text: 'hiro', point: 1800, rank: 2),
  const Choice(title: 'Pick Up', text: 'matsu', point: 1400, rank:3),
];

class User {
  const User({this.title, this.name, this.point, this.rank});

  final String title;
  final String name;
  final int point;
  final int rank;
}

const List<User> users = const <User>[
  const User(title: 'フォロー中', name: 'ひろなか', point: 8000, rank: 1),
  const User(title: 'ALL', name: 'hiro', point: 7800, rank: 2),
  const User(title: 'Pick Up', name: 'matsu', point: 6400, rank:3),
  const User(title: 'Pick Up', name: 'sato', point: 6100, rank:4),
  const User(title: 'Pick Up', name: 'ueno', point: 5550, rank:5),
  const User(title: 'Pick Up', name: 'karuizawa', point: 4500, rank:6),
  const User(title: 'Pick Up', name: 'izu', point: 3800, rank:7),
  const User(title: 'Pick Up', name: 'hushimi', point: 3400, rank:8),
  const User(title: 'Pick Up', name: 'okayama', point: 3200, rank:9),
  const User(title: 'Pick Up', name: 'kounan', point: 3000, rank:10),
];

class Ranking extends StatelessWidget {

  final List<User> user = users;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
          margin: new EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,0,0),
                  child: Text(
                    ' ',
                    style: TextStyle(
                        fontSize: 3
                      ),
                    ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,0),
                  child: _textCard(user[0], 27.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,3),
                  child: _imageRow(0, 66),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,0),
                  child: _textCard(user[1], 25.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,3),
                  child: _imageRow(1, 33),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,0),
                  child: _textCard(user[2], 23.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,3),
                  child: _imageRow(2, 24),
                ),
                
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[3], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[4], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[5], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[6], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[7], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[8], 20.0, context),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,0,5,5),
                  //height: 100,
                  child: _textCard(user[9], 20.0, context),
                ),
              ],
            )
          )
        ),
        ),
      ),
    );
  }
  Widget _textCard(User user, double size, BuildContext context) {
    final double margin = (size - 15);

    return Container(
      margin: EdgeInsets.fromLTRB(5,0,5,5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            user.rank.toString() + '位  ',
            style: TextStyle( // Styling the text
              fontSize: size,
              color: Colors.black
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, '/user2')
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0,5,0,5),
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: _icons[(user.rank-1)]
                  )
                ),
              ),
            )
          ),
          Text(
            ' ' + user.name,
            style: TextStyle( // Styling the text
              fontSize: size,
              color: Colors.black
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.fromLTRB(0,margin,0,0),
            child: Text(
              'score',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[400]
              ),
            ),
          ),
          Text(
            ' ' + user.point.toString(),
            style: TextStyle( // Styling the text
              fontSize: size,
              color: Colors.black
            ),
          )
        ],
      )
    );
  }

  Widget _imageRow(int index, int score) {
    final int num = score;
    return Container (
      margin: EdgeInsets.fromLTRB(5,0,5,10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 85.0,
            height: 85.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _imagesOfBg[4*index+0]
                    )
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.7),
                  width: 85.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Center(
                    child: Container(
                      child: Text(
                        ((num+5) * 10).toString() +' pt',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.orange[900],
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 85.0,
            height: 85.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _imagesOfBg[4*index+1]
                    )
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.7),
                  width: 85.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Center(
                    child: Container(
                      child: Text(
                        ((num+9) * 10).toString() +' pt',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.orange[900],
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 85.0,
            height: 85.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _imagesOfBg[4*index+2]
                    )
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.7),
                  width: 85.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Center(
                    child: Container(
                      child: Text(
                        ((num+3) * 10).toString() +' pt',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.orange[900],
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 85.0,
            height: 85.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: _imagesOfBg[4*index+3]
                    )
                  ),
                ),
                Container(
                  color: Colors.white.withOpacity(0.7),
                  width: 85.0,
                  height: 20.0,
                  margin: new EdgeInsets.fromLTRB(0, 65, 0, 0),
                  child: Center(
                    child: Container(
                      child: Text(
                        ((num+1) * 10).toString() +' pt',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.orange[900],
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
      ]
    )
  );
}

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
    AssetImage(
      'assets/icon/icon-6.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-7.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-8.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-9.jpeg',
    ),
    AssetImage(
      'assets/icon/icon-10.jpeg',
    ),
  ];

     final List<AssetImage> _imagesOfBg = [
    AssetImage(
      'assets/images/IMAGE-1.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-2.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-3.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-4.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-5.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-6.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-7.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-8.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-9.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-10.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-11.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-12.jpeg',
    ),
  ];
}