import 'dart:math';

/// Donut chart with labels example. This is a simple pie chart with a hole in
/// the middle.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../theme.dart';

class MyPage extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  int index =0;

  MyPage(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory MyPage.withSampleData() {
    return new MyPage(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         title: new Text(
          'Kakeibogram',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'GreatVibes-Regular',
          ),
        ),
         //elevation: 4.0,
       ),
       body: SingleChildScrollView(
         child: Container(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.fromLTRB(15,5,15,5),
                   //  height: 120,
                   //  width: 250,
                   child: _myPageHeader(users[0]),
                 ),
                 Container(
                    margin: EdgeInsets.fromLTRB(15,5,15,0),
                    child: Text(
                      '5/25~6/25の家計簿',
                      style: TextStyle(
                        fontSize: 19,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                 ),
                 Container(
                   margin: EdgeInsets.fromLTRB(0,0,0,0),
                   height: 250,
                   width: 250,
                   child: _chart(),
                 ),
                 _line(),
                 _area1() //画像集
               ],
             ),
         ),
       ),
    );
  }

  Widget _area1() {
    return Container(
      child: Column(
        children: <Widget>[
          _imageLine(),
          _imageLine(),
          _imageLine(),
          _imageLine(),
        ],
      ),
    );
  }

  Widget _imageLine() {
    return Container(
      margin: new EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _oneImage(),
          ),
          Expanded(
            child: _oneImage(),
          ),
          Expanded(
            child: _oneImage(),
          ),
        ],
      ),
    );
  }

  Widget _oneImage() {
    index += 1;
    return Container(
      margin: new EdgeInsets.fromLTRB(1, 0, 1, 0),
      width: 125.0,
      height: 125.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: _imagesOfBg[index],
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.7),
            width: 85.0,
            height: 20.0,
            margin: new EdgeInsets.fromLTRB(40, 5, 0, 0),
            child: Center(
              child: Container(
                child: Text(
                  '¥800',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Container(
        margin: const EdgeInsets.fromLTRB(20,0,20,0),
        child: Divider()
    );
  }

  Widget _chart(){
    return charts.PieChart(
          seriesList,
          animate: animate,
          defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]
          )
    );
  }

  Widget _myPageHeader(User user){
    return Container(
      margin: EdgeInsets.fromLTRB(0,0,0,0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1, // 左列
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container( //icon
                  margin: EdgeInsets.fromLTRB(25,5,0,5),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: _icons[(user.rank-1)]
                      )
                  ),
                ),
                Container( // username
                    margin: EdgeInsets.fromLTRB(20,0,0,0),
                    child: Text(
                      user.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                ),
                Container( //ID
                  margin: EdgeInsets.fromLTRB(15,0,0,0),
                    child: Text(
                      '@' + user.id,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2, //右列
            child: Column( // 右列　1行目
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(8,0,8,5),
                          child: Text(
                            '100',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Follow',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ] 
                    ),
                    ),

                    Expanded( 
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(8,0,8,5),
                          child: Text(
                            '100',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Follower',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ] 
                    ),
                    ),

                    Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(8,0,8,5),
                          child: Text(
                            '100',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '投稿',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ] 
                    ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0,15,0,0),
                  child: Center(
                    child: Text(
                      'score: 8000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20
                        //fontWeight: FontWeight.bold
                      )
                    ),
                  )
                )
              ]
            ),
          ),
        ],
      ),
    );
  }

  List<AssetImage> _icons = [
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
    AssetImage(
      'assets/images/IMAGE-13.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-14.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-15.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-16.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-17.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-18.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-19.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-20.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-21.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-22.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-23.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-24.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-25.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-26.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-27.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-28.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-29.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-30.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-31.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-32.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-33.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-34.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-35.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-36.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-37.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-38.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-39.jpeg',
    ),
    AssetImage(
      'assets/images/IMAGE-40.jpeg',
    ),
  ];
}

/// Create one series with sample hard coded data.
List<charts.Series<LinearSales, int>> _createSampleData() {
  final data = [
    new LinearSales(0, 29, Colors.blue[300],'住宅'),
    new LinearSales(1, 12, Colors.purple[200],'衣類'),
    new LinearSales(2, 9, Colors.orange[400],'趣味'),
    new LinearSales(3, 9, Colors.blue[600],'交通費'),
    new LinearSales(4, 6, Colors.green[300],'通信費'),
    new LinearSales(5, 9, Colors.indigo[700],'食費'),
    new LinearSales(6, 13, Colors.pink[500],'交際費'),
    new LinearSales(7, 12, Colors.grey[800],'貯金'),
  ];

  return [
    new charts.Series<LinearSales, int>(
      id: 'Sales',
      domainFn: (LinearSales sales, _) => sales.year,
      measureFn: (LinearSales sales, _) => sales.sales,
      colorFn: (LinearSales sales, _) => sales.color,
      data: data,
      // Set a label accessor to control the text of the arc label.
      labelAccessorFn: (LinearSales row, _) => '${row.name}',
    )
  ];
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final charts.Color color;
  final String name;

  LinearSales(this.year, this.sales, color, this.name)
  : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class User {
  const User({this.title, this.name, this.point, this.rank, this.id});

  final String title;
  final String name;
  final int point;
  final int rank;
  final String id;
}

const List<User> users = const <User>[
  const User(title: 'フォロー中', name: 'sato', point: 8000, rank: 1, id: 'mhsato'),
  const User(title: 'ALL', name: 'hiro', point: 7800, rank: 2, id: 'hiropon'),
  const User(title: 'Pick Up', name: 'matsu', point: 6400, rank:3, id: 'matsu0322'),
  const User(title: 'Pick Up', name: 'sato', point: 6100, rank:4, id: 'sato0910'),
  const User(title: 'Pick Up', name: 'ueno', point: 5550, rank:5, id: 'uenokoen'),
  const User(title: 'Pick Up', name: 'karuizawa', point: 4500, rank:6, id: 'kei'),
  const User(title: 'Pick Up', name: 'izu', point: 3800, rank:7, id: 'izuizu'),
];