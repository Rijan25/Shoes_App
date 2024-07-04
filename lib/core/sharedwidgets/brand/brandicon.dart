import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoesapp/core/constants/assetspath.dart';
import 'package:shoesapp/core/services/get.dart';

class BrandDisplay extends StatelessWidget {
  const BrandDisplay(this.brand, {super.key});
  final String brand;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      brandIcon[brand]!,
      color: Get.disabledColor.o5,
      height: 25.h,
      width: 20.w,
    );
  }
}

const brand = ['Nike', 'Jordan', 'Adidas', 'Reebok', 'Puma', 'Vans'];

const brandIcon = {
  'Nike': AssetsPath.nike,
  'Puma': AssetsPath.puma,
  'Adidas': AssetsPath.adidas,
  'Reebok': AssetsPath.reebok,
  'Jordan': AssetsPath.jordan,
  'Vans': AssetsPath.vans,
};
