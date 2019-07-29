import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PostWidget(),
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
       child: Center(
         child: ChangeForm(),
        ),
      )
    );
  }

   String _text = '';

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget ChangeForm(){
        return Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             Container(
              child: Center(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //children: <Widget>[
                  child: Text(
                    'あなたのお金の使い方を教えて下さい',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700
                      ),
                  ),
                //],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0,30,0,0),
              child: Center(
                child: _image == null
                  ? Text('No image selected.')
                  : GestureDetector(
                      onTap: () => getImage(),
                      child: Image.file(_image),
                    ),
              ),
            ),
            Container(
              child: _image == null
              ? Center(
                  child: FlatButton(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.orange[200],
                    onPressed: getImage,
                    child: Text(
                      '画像を選択',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              : Text(''),
            ),
            new TextField(
              enabled: true,
              maxLength: 20,
              maxLengthEnforced: false,
              obscureText: false,
              //autovalidate: false,
              decoration: const InputDecoration(
                hintText: '商品名を入力',
                labelText: '商品名',
                labelStyle: TextStyle(
                  fontSize: 15)
              ),
            ),
            new TextField(
              enabled: true,
              maxLength: 20,
              maxLengthEnforced: false,
              obscureText: false,
              //autovalidate: false,
              decoration: const InputDecoration(
                hintText: '金額を記入',
                labelText: '金額 *',
                labelStyle: TextStyle(
                  fontSize: 15)
              ),
            ),
            new TextField(
              enabled: true,
              maxLength: 20,
              maxLengthEnforced: false,
              obscureText: false,
              //autovalidate: false,
              decoration: const InputDecoration(
                hintText: 'コメントを記入',
                labelText: 'コメント *',
                labelStyle: TextStyle(
                  fontSize: 15)
              ),
            ),
            Text(
              '分類',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700]
                ),
            ),
          new DropdownButton<String>(
            hint: new Text('分類を選んでください'),
            items: <String>['住宅', '趣味', '食費', '衣類', '交通費', '交際費'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,10),
            child: Center(
            child: FlatButton(
            padding: EdgeInsets.all(10.0),
            color: Colors.orange[200],
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title :Text("にゃーん"),
                  content: Text('体験版はここまでです。\n製品版をお待ち下さい。'),
                )
              );
            },
            child: Text(
              'post',
              style: TextStyle(
                fontSize: 20,
              ),
              ),
          ),
            )
          )
          ],
        )
    );
  }
}

class FileController {
  // ドキュメントのパスを取得
  static Future get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 画像をドキュメントへ保存する。
  // 引数にはカメラ撮影時にreturnされるFileオブジェクトを持たせる。
  static Future saveLocalImage(File image) async {
    final path = await localPath;
    final imagePath = '$path/image.png';
    File imageFile = File(imagePath);
    // カメラで撮影した画像は撮影時用の一時的フォルダパスに保存されるため、
    // その画像をドキュメントへ保存し直す。
    var savedFile = await imageFile.writeAsBytes(await image.readAsBytes());
    // もしくは
    // var savedFile = await image.copy(imagePath);
    // でもOK

    return savedFile;
  }
}