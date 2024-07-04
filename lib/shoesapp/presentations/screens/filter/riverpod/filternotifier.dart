import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifier extends ChangeNotifier {
  String? brandName;
  double lowerPrice = 0;
  double upperPrice = 5000;
  int? type;
  int? gender;
  int? color;
  int totalFilter = 0;

  updateAll(FilterNotifier notify) {
    brandName = notify.brandName;
    lowerPrice = notify.lowerPrice;
    upperPrice = notify.upperPrice;
    notifyListeners();
  }

  updateBrandName(brandName) {
    this.brandName = brandName;
    checkTotalUpdate();
    notifyListeners();
  }

  updatePriceRange(RangeValues range) {
    lowerPrice = range.start * 5000;
    upperPrice = range.end * 5000;
    checkTotalUpdate();
    notifyListeners();
  }

  updateGender(gender) {
    this.gender = gender;
    checkTotalUpdate();
    notifyListeners();
  }

  updateType(type) {
    this.type = type;
    checkTotalUpdate();
    notifyListeners();
  }

  updateColor(color) {
    this.color = color;
    checkTotalUpdate();
    notifyListeners();
  }

  checkTotalUpdate() {
    totalFilter = 0;
    if (color != null) totalFilter++;
    if (brandName != null) totalFilter++;
    if (type != null) totalFilter++;
    if (gender != null) totalFilter++;
    if (lowerPrice != 0 || upperPrice != 5000) totalFilter++;
  }
}

final filterNotifier = ChangeNotifierProvider((ref) => FilterNotifier());
