import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shoesapp/shoesapp/presentations/screens/review/model/reviewmodels.dart';

final reviewProvider = FutureProvider.family((ref, FilterReview review) {
  final lowerRate =
      review.rating != null ? double.parse(review.rating!) - 1 : null;
  final upperRate = review.rating != null ? double.parse(review.rating!) : null;
  final doc = FirebaseFirestore.instance
      .collection("reviews")
      .doc("AllReviews")
      .collection(review.id);
  final docList = doc
      .where('rate', isGreaterThan: lowerRate)
      .where('rate', isLessThan: upperRate)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((e) => Review.fromJson(e.data())).toList());
  return docList.first;
});

class FilterReview {
  String id;
  String? rating;

  FilterReview({required this.id, this.rating});

  @override
  bool operator ==(covariant FilterReview other) {
    if (identical(this, other)) return true;

    return other.id == id && other.rating == rating;
  }

  @override
  int get hashCode => id.hashCode ^ rating.hashCode;
}
