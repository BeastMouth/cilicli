import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // scaffold 布局结构
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text('首 页',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
//        actions: <Widget>[
//          new IconButton(
//            icon: new Icon(
//              Icons.search,
//              color: Colors.white,
//            ),
//            onPressed: () {},
//          )
//        ],
      ),
      body: new Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              '首页',
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
