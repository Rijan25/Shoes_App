import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/services/get.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/model/reviewmodels.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../core/sharedwidgets/imagewidgets/commonetworkimage.dart';
import '../../../../../core/sharedwidgets/specialwidgets/rating.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.rating});

  final Review rating;

  @override
  Widget build(BuildContext context) {
    final time = timeago.format(rating.dateTime);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularNetworkImage(imageUrl: rating.imageUrl, radius: 50),
        20.horizontalSpace,
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150.w),
                    child: AutoSizeText(rating.profileName,
                        maxLines: 1, style: Get.bodyLarge.px16.h12)),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 70.w),
                  child: AutoSizeText(time,
                      style: Get.titleMedium.px13.disabledO5.h1, maxLines: 1),
                )
              ],
            ),
            Rating(rating.rate),
            Text(rating.discription,
                maxLines: 2, style: Get.bodySmall.h12.px15),
            15.verticalSpace,
          ],
        )),
      ],
    );
  }
}
