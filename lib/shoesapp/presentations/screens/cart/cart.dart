import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/sharedwidgets/widgets.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/riverpod/cartriverpod.dart';
import 'package:shoesapp/shoesapp/presentations/screens/ordersummary/ordersummary.dart';
import '../../../../core/services/get.dart';
import 'widgets/cartview.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(myCarts);
    final isLoading = ValueNotifier(false);
    return PlatformScaffold(
        appBar: PlatformAppBar(title: Text("Cart", style: Get.bodyLarge.px20)),
        body: cartProvider.when(
            error: (error, stackTrace) => const Text("Error"),
            loading: () => const ApprogressIndicator(),
            data: (carts) {
              double totalPrice = 0;
              if (carts.isEmpty) {
                return const Center(child: Text("No Order"));
              }
              for (var i in carts) {
                totalPrice += i.quantity * i.shoes.price;
              }
              final grandtotal = totalPrice.toStringAsFixed(2);
              return Stack(
                children: [
                  ListView.builder(
                      padding: const EdgeInsets.all(10).r,
                      itemCount: carts.length + 1,
                      itemBuilder: (context, index) {
                        if (index == carts.length) {
                          return 60.verticalSpace;
                        }
                        final cart = carts[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10).r,
                            child: CartView(cart: cart));
                      }),
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
                                  Text("\$$grandtotal",
                                      style: Get.bodyLarge.px16)
                                ]),
                            10.horizontalSpace,
                            Consumer(
                              builder: (context, ref, child) {
                                return SizedBox(
                                  width: 130.w,
                                  child: AppButton(
                                      text: "Check Out",
                                      radius: 150.r,
                                      valueListenable: isLoading,
                                      onTap: () {
                                        Get.to(const OrderSummary());
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
