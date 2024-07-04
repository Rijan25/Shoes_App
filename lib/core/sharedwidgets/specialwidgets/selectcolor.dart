import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/sharedwidgets/botton/appicon.dart';
import 'package:shoesapp/core/sharedwidgets/specialwidgets/mycard.dart';
import 'package:shoesapp/shoesapp/domains/selectshoesriverpod.dart';

class SelectColor extends ConsumerWidget {
  const SelectColor({super.key, required this.shoe});
  final Shoes shoe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectShoes = ref.watch(selectedShoes(shoe));
    return Mycard(
        color: AppColors.white,
        margin: const EdgeInsets.all(3).r,
        child: SizedBox(
          height: 30.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: selectColor.length,
            padding: const EdgeInsets.symmetric(horizontal: 3).r,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final color = selectColor.values.elementAt(index);
              final selectedColor = selectColor.keys.elementAt(index);
              final isSelected = selectedColor == selectShoes.shoeColors;
              return GestureDetector(
                  onTap: () {
                    selectShoes.updateShoesColor(selectedColor);
                  },
                  child: SelectView(color: color, isSelected: isSelected));
            },
          ),
        ));
  }
}

class SelectView extends StatelessWidget {
  const SelectView({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0).r,
      child: Container(
        height: 20.h,
        width: 23.h,
        decoration: ShapeDecoration(
            color: color,
            shape:
                const StadiumBorder(side: BorderSide(color: AppColors.grey))),
        child: isSelected
            ? const Center(
                child: AppIcon(Icons.done,
                    padding: EdgeInsets.zero,
                    color: AppColors.yellow,
                    size: 18))
            : const SizedBox.shrink(),
      ),
    );
  }
}

Map<String, Color> selectColor = {
  'White': AppColors.white,
  'Black': AppColors.black,
  'Green': AppColors.teal,
  'Blue': AppColors.blue
};
