import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  Color _color = Colors.grey;
  int get count => _count;
  Color get color => _color;

  void setColor(Color ncolor) {
    _color = ncolor;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void resetCount() {
    _count = 0;
    notifyListeners();
  }
}
