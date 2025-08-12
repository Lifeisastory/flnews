import 'package:flnews/global/variable/global.dart';
import 'package:flutter/widgets.dart';

class CustomScaffoldViewModel extends ChangeNotifier {
  double _barOffset = 0.0;
  double get barOffset => _barOffset;

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  var _lastOffset = 0.0;
  var _delta = 0.0;

  // 热榜页面底部栏上滑隐藏，下滑出现
  void onScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      final current = notification.metrics.pixels;
      _delta = current - _lastOffset;
      _lastOffset = current;
      _barOffset = (_barOffset + _delta).clamp(0.0, Global.barHeight);
    }
    if (notification is ScrollEndNotification) {
      if (_delta > 0) {
        _barOffset = Global.barHeight;
      } else {
        _barOffset = 0.0;
      }
    }
    notifyListeners();
  }

  void switchPage(int index) {
    _barOffset = 0.0;
    _currentPageIndex = index;
    notifyListeners();
  }
}
