import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/sharedwidgets/botton/appicon.dart';

import '../../configs/app_colors.dart';
import '../../services/get.dart';

class Rating extends StatelessWidget {
  const Rating(this.rate, {super.key, this.noOfRating});
  final double rate;
  final String? noOfRating;
  @override
  Widget build(BuildContext context) {
    final ratevalue = rate.ceil();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final iconColor =
                  index < ratevalue ? AppColors.yellow : Get.disabledColor.o1;
              return AppIcon(Get.star,
                  color: iconColor, size: 18, padding: EdgeInsets.zero);
            },
          ),
        ),
        if (noOfRating != null) 8.horizontalSpace,
        if (noOfRating != null) Text('$rate'),
        if (noOfRating != null) 8.horizontalSpace,
        if (noOfRating != null)
          Text("( $noOfRating Reviews )", style: Get.displaySmall.disabledO5)
      ],
    );
  }
}
