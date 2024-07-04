import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesapp/core/services/get.dart';

import '../../../../../core/configs/exportconfig.dart';
import '../../../../../core/sharedwidgets/widgets.dart';
import '../../../../domains/riverpod.dart';
import '../riverpod/filternotifier.dart';

class SortBy extends ConsumerWidget {
  const SortBy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const sortValue = ['Most Recent', 'Lowest Price', 'Highest Price'];
    final filter = ref.watch(filterNotifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10).r,
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          itemCount: sortValue.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Color bottonColor = AppColors.white;
            Color textColor = AppColors.black;
            if (index == filter.type) {
              bottonColor = AppColors.black;
              textColor = AppColors.white;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5).r,
              child: SizedBox(
                  width: 140.w,
                  child: AppButton(
                      bgcolor: bottonColor,
                      textColor: textColor,
                      onTap: () => filter.updateType(index),
                      radius: 50.r,
                      text: sortValue[index])),
            );
          },
        ),
      ),
    );
  }
}

class SortByGender extends ConsumerWidget {
  const SortByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const sortValue = ['Man', 'Woman', 'Unisex'];
    final filter = ref.watch(filterNotifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10).r,
      child: SizedBox(
        height: 40.h,
        child: ListView.builder(
          itemCount: sortValue.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Color bottonColor = AppColors.white;
            Color textColor = AppColors.black;
            if (index == filter.gender) {
              bottonColor = AppColors.black;
              textColor = AppColors.white;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5).r,
              child: SizedBox(
                  width: 100.w,
                  child: AppButton(
                      bgcolor: bottonColor,
                      textColor: textColor,
                      onTap: () => filter.updateGender(index),
                      radius: 50.r,
                      text: sortValue[index])),
            );
          },
        ),
      ),
    );
  }
}

class SelectColorView extends ConsumerWidget {
  const SelectColorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterNotifier);
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: selectColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final colorName = selectColor.keys.elementAt(index);
          final color = selectColor[colorName];
          final opacity = index == filter.color ? 1.0 : 0.2;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5).r,
            child: SizedBox(
                width: 110.w,
                child: AppIconButon(
                    icon: Icons.circle,
                    iconColor: color,
                    color: Get.disabledColor.withOpacity(opacity),
                    title: colorName,
                    onTap: () => filter.updateColor(index),
                    radius: 100)),
          );
        },
      ),
    );
  }
}

Map<String, Color> selectColor = {
  'Red': AppColors.red,
  'Blue': AppColors.blue,
  'Green': AppColors.teal,
  'White': AppColors.grey.o15,
  'Black': AppColors.black,
};

class PriceRangeSlider extends ConsumerWidget {
  const PriceRangeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterNotifier);
    final lowerRange = filter.lowerPrice / 5000;
    final upperRange = filter.upperPrice / 5000;
    final values = RangeValues(lowerRange, upperRange);
    final labels =
        RangeLabels(filter.lowerPrice.toString(), filter.upperPrice.toString());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderThemeData(
              trackHeight: 1,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 40.r)),
          child: RangeSlider(
            values: values,
            activeColor: Get.disabledColor,
            inactiveColor: Get.disabledColor.o4,
            labels: labels,
            divisions: 10,
            onChanged: (value) {
              filter.updatePriceRange(value);
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("\$0"),
            Text("\$1250"),
            Text("\$2500"),
            Text("\$3250"),
            Text("\$5000")
          ],
        ),
        15.verticalSpace,
      ],
    );
  }
}

class SelectBrand extends ConsumerWidget {
  const SelectBrand({super.key, required this.brandName});
  final String brandName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterNotifier);
    final image = brandIcon[brandName];
    final listShoes = ref.watch(shoesList(brandName));
    final isSelected = filter.brandName == brandName;
    return GestureDetector(
      onTap: () => filter.updateBrandName(brandName),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: Get.disabledColor.o15, shape: BoxShape.circle),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(9.0).r,
                            child: SvgPicture.asset(image!, width: 27)))),
                if (isSelected)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Get.disabledColor, shape: BoxShape.circle),
                      child: Center(
                          child: AppIcon(Icons.check,
                              size: 12, color: Get.scaffoldBackgroundColor)),
                    ),
                  )
              ],
            ),
            Text(brandName.toUpperCase(), style: Get.bodyMedium.px16.h15),
            listShoes.when(
              error: (error, stackTrace) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
              data: (data) {
                final totalItems = data.length;
                return Text("$totalItems Items", style: Get.bodySmall);
              },
            )
          ],
        ),
      ),
    );
  }
}
