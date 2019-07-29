import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakeibogram/ui/ranking.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../theme.dart';
import 'home_page.dart';
import 'kakeibo.dart';
import 'mypage.dart';
import 'new_post.dart';
import 'home_page_sub.dart';
import 'post_detail.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KakeiboGram(仮)',
      theme: themeData,
      home: MyHomePage(),
      routes: {
        '/user': (BuildContext context) => HomePagesubPage(),
        '/post_detail': (BuildContext context) => PostDetailPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  static List<charts.Series<LinearSales, int>> _createSampleData() {
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

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text('KakeiboGram(仮)'),
      //   //elevation: 4.0,
      // ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          new HomePage(),
          new SettingsPage(),
          new PostPage(),
          new RankingPage(),
          new MyPage(_createSampleData()),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              backgroundColor: Colors.orange[200],
              title: new Text("Home")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance_wallet),
              backgroundColor: Colors.orange[200],
              title: new Text("Kakeibo")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add_a_photo),
              backgroundColor: Colors.orange[200],
              title: new Text("New Post")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.stars),
              backgroundColor: Colors.orange[200],
              title: new Text("Ranking")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("Person")
          ),
        ],
        fixedColor: Colors.orange[900],
      ),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
