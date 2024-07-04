import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/sharedwidgets/widgets.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/cart.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/models/cartmodels.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/review.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/widgets/reviewpresentation.dart';

import '../../../core/services/get.dart';
import '../../domains/selectshoesriverpod.dart';
import 'homescreen.dart';

class ShoesInfoView extends StatelessWidget {
  const ShoesInfoView(this.shoes, {super.key});

  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    final isLoading = ValueNotifier(false);
    return PlatformScaffold(
      appBar: PlatformAppBar(
          trailingActions: [const CartIcon(), 20.horizontalSpace]),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
            children: [
              Stack(
                children: [
                  Mycard(
                    color: Get.disabledColor.oo6,
                    margin: EdgeInsets.zero,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 35.0, vertical: 45)
                                .r,
                            child: CommonRectangularImage(
                                url: shoes.imageUrl, tag: shoes.id)),
                        10.verticalSpace,
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const AppIcon(Icons.more_horiz_outlined,
                                  size: 40, padding: EdgeInsets.zero),
                              SelectColor(shoe: shoes)
                            ]),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10.r,
                    right: 10.r,
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.scaffoldBackgroundColor),
                        child: const AppIcon(Icons.favorite_border,
                            padding: EdgeInsets.all(5))),
                  )
                ],
              ),
              15.verticalSpace,
              Text(shoes.name, style: Get.bodyLarge),
              5.verticalSpace,
              Rating(shoes.rating, noOfRating: shoes.noOfRating),
              Text("Size", style: Get.headlineLarge.px20.h2),
              SelectSize(shoes),
              Text("Description", style: Get.headlineLarge.px20.h2),
              5.verticalSpace,
              Text(shoes.discription,
                  style: Get.displaySmall.px15.h12.disabledO5),
              Text("Review (${shoes.noOfRating})",
                  style: Get.headlineLarge.px20.h2),
              ReviewPresentation(id: shoes.id, itemCount: 3),
              AppButton(
                  onTap: () => Get.to(ReviewPage(shoes)),
                  bgcolor: Get.scaffoldBackgroundColor,
                  textColor: Get.disabledColor,
                  radius: 100,
                  text: "Get Full review"),
              60.verticalSpace
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
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: Get.bodySmall),
                          Text("\$${shoes.price}", style: Get.bodyLarge.px16)
                        ]),
                    10.horizontalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return SizedBox(
                          width: 130.w,
                          child: AppButton(
                              text: "ADD TO CART",
                              radius: 200,
                              valueListenable: isLoading,
                              onTap: () async {
                                isLoading.value = true;
                                await updateCard(shoes, ref);
                                isLoading.value = false;
                                modalSheet();
                              }),
                        );
                      },
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  Future<dynamic> modalSheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      context: Get.context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Get.disabledColor),
                    shape: BoxShape.circle),
                child: AppIcon(Icons.check,
                    size: 85, color: Get.disabledColor.o4)),
            10.verticalSpace,
            Text("1 Items Added", style: Get.bodySmall.px18),
            25.verticalSpace,
            Row(
              children: [
                10.horizontalSpace,
                Expanded(
                    child: AppButton(
                        radius: 100,
                        bgcolor: AppColors.white,
                        textColor: AppColors.black,
                        onTap: () => Get.offAll(const HomeScreen()),
                        text: "Back Explore")),
                10.horizontalSpace,
                Expanded(
                    child: AppButton(
                        radius: 100,
                        bgcolor: AppColors.black,
                        textColor: AppColors.white,
                        onTap: () => Get.off(const CartPage()),
                        text: "To Cart")),
                10.horizontalSpace,
              ],
            ),
            25.verticalSpace,
          ],
        );
      },
    );
  }
}

updateCard(Shoes shoes, WidgetRef ref) async {
  final selectedShoe = ref.watch(selectedShoes(shoes));
  final docUser = FirebaseFirestore.instance.collection("MyCarts");
  final cart = Cart(
      id: faker.guid.guid(),
      shoes: shoes,
      shoesSize: selectedShoe.shoesSize,
      quantity: selectedShoe.quantity,
      shoeColors: selectedShoe.shoeColors);
  await docUser.doc(cart.id).set(cart.toJson());
}
