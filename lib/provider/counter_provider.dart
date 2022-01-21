import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;
  int get getCount => count;
  incrementCount() {
    count++;
    notifyListeners();
  }

  decrementCount() {
    count--;
    notifyListeners();
  }
}
