import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  home,
  find,
  mine,
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.home:
      return "主页";
    case LayoutType.find:
      return "发现";
    case LayoutType.mine:
      return "我的";
    default:
      return "";
  }
}
