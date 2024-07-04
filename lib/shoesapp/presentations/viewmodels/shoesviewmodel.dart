import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/services/get.dart';
import 'package:shoesapp/core/sharedwidgets/brand/brandicon.dart';

import '../../../core/sharedwidgets/imagewidgets/commonetworkimage.dart';
import '../../../core/sharedwidgets/specialwidgets/mycard.dart';
import '../screens/review/widgets/displayrating.dart';
import '../screens/shoesinfo.dart';

class ShoesViewModel extends StatelessWidget {
  const ShoesViewModel(this.shoe, {super.key});

  final Shoes shoe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ShoesInfoView(shoe)),
      child: Column(
        children: [
          Stack(
            children: [
              Mycard(
                  margin: const EdgeInsets.all(8).r,
                  color: Get.disabledColor.oo8,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                            .r,
                    child: SizedBox(
                        height: 75.h,
                        child: CommonRectangularImage(
                            tag: shoe.id,
                            url: shoe.imageUrl,
                            fit: BoxFit.contain)),
                  )),
              Positioned(top: 15, left: 30, child: BrandDisplay(shoe.brand))
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(shoe.name, style: Get.bodyMedium.px16, maxLines: 1),
              3.verticalSpace,
              DisplayRating(shoe),
              Text("\$${shoe.price}", style: Get.bodyLarge.px17.h12)
            ],
          )
        ],
      ),
    );
  }
}
