import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/models/cartmodels.dart';

final myCarts = StreamProvider((ref) {
  final doc = FirebaseFirestore.instance.collection("MyCarts").snapshots().map(
      (snapshot) => snapshot.docs.map((e) => Cart.fromJson(e.data())).toList());
  return doc;
});
