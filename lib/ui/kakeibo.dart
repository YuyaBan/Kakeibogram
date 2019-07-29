import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SettingListWidget(),
      ),
    );
  }
}

class SettingListWidget extends StatefulWidget {
  @override
  _SettingListWidgetState createState() => _SettingListWidgetState();
}

class _SettingListWidgetState extends State<SettingListWidget> {

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
         //elevation: 4.0,
       ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _area1(), //総資産額
          _line(),
          _area2(), // 円グラフ
          _line(),
          _area3(size),  //資産の推移
        ],
      ),
    );
  }
}

Widget _area1() {
  return Container(
      margin: EdgeInsets.fromLTRB(20,0,10,10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "総資産額",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                Container(
                  child: Text(
                    " ",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                Container(
                  child: Text(
                    " ",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    " ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    " ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "¥1,0000,000",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                ),
                Container(
                  child: Text(
                    "前日比 ¥-12,000",
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
  );
}

Widget _area2() {
  return Container(
    margin: EdgeInsets.fromLTRB(20,0,10,10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,10),
            child: Text(
              "今月の家計簿 (7/25 ~ 8/24)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset('assets/graph/graph1.png'),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          " ",
                          style: TextStyle(
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "収入  ¥250,000",
                          style: TextStyle(
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "支出  ¥ -14,000",
                          style: TextStyle(
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          "収支  ¥236,000",
                          style: TextStyle(
                              fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          " ",
                          style: TextStyle(
                              fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ],
    ),
  );
}

Widget _area3(Size size) {
  return Container(
    margin: EdgeInsets.fromLTRB(20,0,10,10),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,10),
            child: Text(
              "資産の推移",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Container(
            height: 170,
            width: size.width,
            child: Image.asset(
              "assets/graph/graph2.png"
            )
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