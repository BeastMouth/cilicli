import 'package:cilicli/layout_type.dart';
import 'package:cilicli/widget/find_page.dart';
import 'package:cilicli/widget/home_page.dart';
import 'package:cilicli/widget/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  // 实现数据共享和变更通知
  final Store<int> store;
  final String title;

  // key 当组件在组件树中移动时使用Key可以保持组件之前的状态，比如在用户滑动时或者集合改变时
  // 当使用Stateless Widget时，并不需要使用key
  App({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
            primaryIconTheme: const IconThemeData(color: Colors.white),
            brightness: Brightness.light,
            primaryColor: new Color.fromARGB(255, 0, 215, 198),
            accentColor: Colors.cyan[300]),
//      home: SplashPage(),
        home: new MainPage(
          title: 'FindU',
        ));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _layoutSelection = LayoutType.home;

  // 选中未选中颜色切换
  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection ? Colors.cyan[300] : Colors.grey;
  }

  // 构建底部菜单
  BottomNavigationBarItem _buildItem(
      {String icon, LayoutType layoutSelection}) {
    // 获取菜单名称
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
        icon: new Image.asset(
          icon,
          width: 35.0,
          height: 35.0,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: _colorTabMatching(layoutSelection: layoutSelection),
          ),
        ));
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: _layoutSelection == LayoutType.home
                ? "images/ic_main_tab_company_pre.png"
                : "images/ic_main_tab_company_nor.png",
            layoutSelection: LayoutType.home),
        _buildItem(
            icon: _layoutSelection == LayoutType.find
                ? "images/ic_main_tab_find_pre.png"
                : "images/ic_main_tab_find_nor.png",
            layoutSelection: LayoutType.find),
        _buildItem(
            icon: _layoutSelection == LayoutType.mine
                ? "images/ic_main_tab_my_pre.png"
                : "images/ic_main_tab_my_nor.png",
            layoutSelection: LayoutType.mine),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.home);
        break;
      case 1:
        _onLayoutSelected(LayoutType.find);
        break;
      case 2:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.home:
        return HomePage();
      case LayoutType.find:
        return FindPage();
      case LayoutType.mine:
        return MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}
