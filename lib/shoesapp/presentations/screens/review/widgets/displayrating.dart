import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/services/get.dart';
import 'package:shoesapp/core/sharedwidgets/botton/appicon.dart';

class DisplayRating extends StatelessWidget {
  const DisplayRating(this.shoes, {super.key, this.showTotal = true});
  final Shoes shoes;
  final bool showTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIcon(Get.star,
            color: AppColors.yellow, padding: EdgeInsets.zero, size: 20),
        3.horizontalSpace,
        Text('${shoes.rating}', style: Get.headlineMedium),
        8.horizontalSpace,
        if (showTotal)
          Text("( ${shoes.noOfRating} Reviews )",
              style: Get.displaySmall.disabledO5)
      ],
    );
  }
}
