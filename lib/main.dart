import 'package:flutter/material.dart';

class ClicliAppBar extends StatelessWidget{
  ClicliAppBar({this.title});

  // Widget子类中的字段往往都会定义为final
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.black12),
      child: new Container(
        padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
        child: Align(
          alignment: Alignment.center,
          child: title,
        ),
      )
    );
  }
}

class ClicliScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
    return new Material(
      // Column is 垂直方向的线性布局.
      child: new Column(
        children: <Widget>[
          new ClicliAppBar(
            title: new Text('Clicli', style: Theme
                .of(context)
                .primaryTextTheme
                .title,),
          ),
          new Expanded(child: new Center(child: new Text('Hello world !'),)),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildBottomButtonColumn(Icons.home, 'home', context),
                buildBottomButtonColumn(Icons.menu, 'menu', context),
                buildBottomButtonColumn(Icons.insert_emoticon, 'me', context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildBottomButtonColumn(IconData icon, String label,
      BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return new Column(
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 6.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'Clicli',
    home: new ClicliScaffold(),
  ));
}