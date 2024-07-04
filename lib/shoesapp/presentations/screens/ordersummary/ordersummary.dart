import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/sharedwidgets/widgets.dart';

import '../../../../core/services/get.dart';
import '../../../../core/services/meta.dart';
import '../cart/riverpod/cartriverpod.dart';
import '../homescreen.dart';

class OrderSummary extends ConsumerWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(myCarts);
    double subTotal = 0;
    String grandTotal = '';
    final isLoading = ValueNotifier(false);
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text('Order Summary'),
        ),
        body: cartProvider.when(
            error: (error, stackTrace) => const SizedBox.shrink(),
            loading: () => const ApprogressIndicator(),
            data: (carts) {
              for (var i in carts) {
                subTotal += i.quantity * i.shoes.price;
              }
              grandTotal = (subTotal + 20).toStringAsFixed(2);
              return Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.all(10).r,
                    children: [
                      Text('\tInformation', style: Get.bodyLarge.h1.px20),
                      7.verticalSpace,
                      AppListTile(
                        title: 'Payment Method',
                        subtitle:
                            Text('Credit Card', style: Get.bodySmall.h15.px15),
                        trailing: AppIcon(Get.rightCheveron),
                      ),
                      const Divider(),
                      AppListTile(
                        title: 'Location',
                        subtitle: Text('Semarang, Indonesia',
                            style: Get.bodySmall.h15.px15),
                        trailing: AppIcon(Get.rightCheveron),
                      ),
                      Text('\tOrder Detail', style: Get.bodyLarge.h2.px20),
                      15.verticalSpace,
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: carts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final cart = carts[index];
                          final total = cart.quantity * cart.shoes.price;
                          final totalPrice = total.toStringAsFixed(2);
                          return AppListTile(
                            materialPadding: EdgeInsets.zero,
                            title: cart.shoes.name,
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${cart.shoes.brand} . ${cart.shoeColors} . ${cart.shoesSize} .Qty ${cart.quantity}',
                                    style: Get.bodySmall.h2.px15),
                                Text('\$$totalPrice',
                                    style: Get.bodyMedium.px17.w800)
                              ],
                            ),
                          );
                        },
                      ),
                      Text('\tPayment Detail', style: Get.bodyLarge.h2.px20),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sub Total', style: Get.bodySmall.h2.px15),
                                Text('\$${subTotal.toStringAsFixed(2)}',
                                    style: Get.bodyMedium.w800)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Shipping', style: Get.bodySmall.h2.px15),
                                Text('\$20.00', style: Get.bodyMedium.w800)
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Order',
                                    style: Get.bodySmall.h2.px15),
                                Text('\$$grandTotal',
                                    style: Get.bodyMedium.w800)
                              ],
                            ),
                          ],
                        ),
                      ),
                      80.verticalSpace
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Grand Total", style: Get.bodySmall),
                                  Text("\$$grandTotal",
                                      style: Get.bodyLarge.px16)
                                ]),
                            10.horizontalSpace,
                            Consumer(
                              builder: (context, ref, child) {
                                return SizedBox(
                                  width: 130.w,
                                  child: AppButton(
                                      text: "Payment",
                                      radius: 150.r,
                                      valueListenable: isLoading,
                                      onTap: () async {
                                        Get.to(const OrderSummary());
                                        isLoading.value = true;
                                        final doc = FirebaseFirestore.instance
                                            .collection("OrderList");
                                        for (var i in carts) {
                                          final docCart = FirebaseFirestore
                                              .instance
                                              .collection("MyCarts");
                                          await doc.doc(i.id).set(i.toJson());
                                          await docCart.doc(i.id).delete();
                                        }
                                        Meta.showToast(
                                            "Order Successfully Created");
                                        isLoading.value = false;
                                        Get.offAll(const HomeScreen());
                                      }),
                                );
                              },
                            )
                          ],
                        )),
                  )
                ],
              );
            }));
  }
}
