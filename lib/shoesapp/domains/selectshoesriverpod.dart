import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';

class SelectedShoes extends ChangeNotifier {
  SelectedShoes(this.shoes);
  final Shoes shoes;
  String shoesSize = '40';
  String shoeColors = "Green";
  int quantity = 1;

  updateShoesSize(String shoesSize) {
    this.shoesSize = shoesSize;
    notifyListeners();
  }

  updateShoesColor(String shoeColors) {
    this.shoeColors = shoeColors;
    notifyListeners();
  }

  updateQuantity(int quantity) {
    this.quantity = quantity;
    notifyListeners();
  }
}

final selectedShoes =
    ChangeNotifierProvider.family((ref, Shoes shoes) => SelectedShoes(shoes));
