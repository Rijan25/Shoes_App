import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/services/get.dart';
import 'package:shoesapp/core/sharedwidgets/specialwidgets/appprogressindicator.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/riverpod/reviewriverpod.dart';

import 'ratingview.dart';

class ReviewPresentation extends ConsumerWidget {
  const ReviewPresentation(
      {super.key, required this.id, this.rate, this.itemCount});
  final String id;
  final String? rate;
  final int? itemCount;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewList =
        ref.watch(reviewProvider(FilterReview(id: id, rating: rate)));
    return reviewList.when(
      error: (error, stackTrace) {
        return const SizedBox.shrink();
      },
      loading: () => const ApprogressIndicator(),
      data: (ratings) {
        return ListView.builder(
          shrinkWrap: itemCount != null,
          physics: itemCount != null
              ? const NeverScrollableScrollPhysics()
              : Get.scrollPhysics,
          padding: const EdgeInsets.all(15).r,
          itemCount: ratings.isNotEmpty ? itemCount ?? ratings.length : 0,
          itemBuilder: (context, index) {
            final rating = ratings[index];
            return RatingView(rating: rating);
          },
        );
      },
    );
  }
}
