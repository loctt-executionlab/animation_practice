import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final offsetProvider = ChangeNotifierProvider<OffsetNotifier>((ref) {
  return OffsetNotifier(ref.watch(pageControllerProvider));
});

final pageControllerProvider = Provider<PageController>((ref) {
  return PageController();
});

class OffsetNotifier extends ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  OffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page ?? 0;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}
