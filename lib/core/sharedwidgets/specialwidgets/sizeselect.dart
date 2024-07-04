import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/shoesapp/domains/selectshoesriverpod.dart';

import '../../services/get.dart';

const size = ['39', '39.5', '40', '40.5', '41'];

class SelectSize extends ConsumerWidget {
  const SelectSize(this.shoes, {super.key});
  final Shoes shoes;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedShoe = ref.watch(selectedShoes(shoes));
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: size.length,
        itemBuilder: (context, index) {
          final isSelected = selectedShoe.shoesSize == size[index];
          return GestureDetector(
            onTap: () => selectedShoe.updateShoesSize(size[index]),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).r,
                child: SizedBox.square(
                    dimension: 35.h,
                    child:
                        Sizeview(size: size[index], isSelected: isSelected))),
          );
        },
      ),
    );
  }
}

class Sizeview extends StatelessWidget {
  const Sizeview({super.key, required this.size, required this.isSelected});
  final String size;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    Color color = Get.disabledColor;
    Color fillColor = AppColors.transparent;
    if (isSelected) {
      color = Get.scaffoldBackgroundColor;
      fillColor = Get.disabledColor;
    }
    return Container(
      decoration: ShapeDecoration(
          color: fillColor,
          shape: StadiumBorder(side: BorderSide(color: color))),
      child: Center(
          child: AutoSizeText(size,
              maxLines: 1, style: Get.bodyMedium.copyWith(color: color))),
    );
  }
}
