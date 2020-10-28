import 'package:flutter/foundation.dart';

class CountryName extends ChangeNotifier {
  String defaultName = 'All';

  void changeName(String searchName) {
    defaultName = searchName;
    notifyListeners();
  }
}
