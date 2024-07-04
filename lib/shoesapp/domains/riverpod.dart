import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/shoesapp/presentations/screens/filter/riverpod/filternotifier.dart';

final shoesList = FutureProvider.family((ref, String? brandName) {
  final filter = ref.watch(filterNotifier);
  final doc = FirebaseFirestore.instance
      .collection("Shoes")
      .where('brand', isEqualTo: brandName ?? filter.brandName)
      .where('price', isLessThanOrEqualTo: filter.upperPrice)
      .where('price', isGreaterThanOrEqualTo: filter.lowerPrice)
      .where('gender',
          isEqualTo: filter.gender != null ? gender[filter.gender!] : null)
      .orderBy('price', descending: filter.type == 2)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => Shoes.fromJson(e.data())).toList());
  return doc.first;
});

const gender = ['Man', 'Woman', 'Unisex'];
