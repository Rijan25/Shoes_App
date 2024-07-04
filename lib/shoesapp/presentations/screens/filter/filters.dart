import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/services/get.dart';
import 'package:shoesapp/core/services/meta.dart';
import 'package:shoesapp/core/sharedwidgets/widgets.dart';
import 'package:shoesapp/shoesapp/presentations/screens/filter/riverpod/filternotifier.dart';
import 'package:shoesapp/shoesapp/presentations/screens/filter/widgets/helperwidget.dart';


class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(title: const Text("Filter")),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(10).r,
            children: [
              const Text("Brand"),
              10.verticalSpace,
              SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    itemCount: brandIcon.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final brandname = brandIcon.keys.elementAt(index);
                      return SelectBrand(brandName: brandname);
                    },
                  )),
              const Text("Price Range"),
              const PriceRangeSlider(),
              const Text("Sort By"),
              10.verticalSpace,
              const SortBy(),
              10.verticalSpace,
              const Text("Gender"),
              10.verticalSpace,
              const SortByGender(),
              10.verticalSpace,
              const Text("Color"),
              20.verticalSpace,
              const SelectColorView()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 55.h,
                color: Get.bottomColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final filter = ref.watch(filterNotifier);
                        return SizedBox(
                            width: 150,
                            child: AppButton(
                                bgcolor: AppColors.transparent,
                                textColor: AppColors.black,
                                onTap: () {
                                  ref.invalidate(filterNotifier);
                                },
                                text: "Clear Filter ${filter.totalFilter}",
                                radius: 150.r));
                      },
                    ),
                    10.horizontalSpace,
                    SizedBox(
                      width: 130.w,
                      child: AppButton(
                          text: "Apply",
                          radius: 150.r,
                          onTap: () {
                            Meta.showToast("Filter Applied");
                            Get.pop();
                          }),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

