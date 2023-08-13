import 'package:flutter/cupertino.dart';

class FooModel extends ChangeNotifier {
  double _size = 20;
  double _angle = 20;
  bool _hasElevation = true;

  double get size => _size;

  set size(size) {
    _size = size;
    notifyListeners();
  }

  double get angle => _angle;

  set angle(angle) {
    _angle = angle;
    notifyListeners();
  }

  bool get hasElevation => _hasElevation;

  set hasElevation(hasElevation) {
    _hasElevation = hasElevation;
    notifyListeners();
  }
}
