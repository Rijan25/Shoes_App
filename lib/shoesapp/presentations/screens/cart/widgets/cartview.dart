import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoesapp/core/sharedwidgets/specialwidgets/mycard.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/models/cartmodels.dart';

import '../../../../../core/configs/app_colors.dart';
import '../../../../../core/services/get.dart';
import '../../../../../core/sharedwidgets/botton/appicon.dart';
import '../../../../../core/sharedwidgets/imagewidgets/commonetworkimage.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.cart});
  final Cart cart;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: true,
      direction: Axis.horizontal,
      endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: (context) {
                  final docCart = FirebaseFirestore.instance
                      .collection("MyCarts")
                      .doc(cart.id);
                  docCart.delete();
                },
                backgroundColor: AppColors.red.o8,
                icon: Get.delete,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25).r,
                    bottomLeft: const Radius.circular(25).r))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Mycard(
              color: AppColors.grey.o1,
              radius: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 25).r,
                child: SizedBox(
                  width: 70.w,
                  height: 30.w,
                  child: CommonRectangularImage(
                      url: cart.shoes.imageUrl, tag: cart.shoes.id),
                ),
              )),
          5.horizontalSpace,
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cart.shoes.name, style: Get.bodyLarge.px17.h1),
              10.verticalSpace,
              Text(
                  '${cart.shoes.brand} . ${cart.shoeColors} . ${cart.shoesSize}',
                  style: Get.bodySmall.px14.disabledO5.h1.w500),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${cart.shoes.price}', style: Get.bodyLarge.px15),
                  Row(
                    children: [
                      addsubtractview(Get.remove, opacity: 0.5,
                          onTap: () async {
                        final docCart = FirebaseFirestore.instance
                            .collection("MyCarts")
                            .doc(cart.id);
                        if (cart.quantity > 1) {
                          await docCart.update({"quantity": cart.quantity - 1});
                          return;
                        }
                        docCart.delete();
                      }),
                      10.horizontalSpace,
                      Text("${cart.quantity}", style: Get.bodyLarge.px17),
                      10.horizontalSpace,
                      addsubtractview(
                        Get.add,
                        onTap: () {
                          final docCart = FirebaseFirestore.instance
                              .collection("MyCarts")
                              .doc(cart.id);
                          docCart.update({"quantity": cart.quantity + 1});
                        },
                      ),
                      10.horizontalSpace
                    ],
                  )
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

  Container addsubtractview(dynamic iconData,
      {VoidCallback? onTap, double opacity = 1}) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Get.disabledColor.withOpacity(opacity))),
        child: AppIcon(iconData,
            onTap: onTap,
            padding: EdgeInsets.zero,
            size: 18,
            color: Get.disabledColor.withOpacity(opacity)));
  }
}
