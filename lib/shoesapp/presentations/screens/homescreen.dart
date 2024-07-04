import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/configs/app_colors.dart';
import 'package:shoesapp/core/services/meta.dart';
import 'package:shoesapp/core/sharedwidgets/widgets.dart';
import 'package:shoesapp/shoesapp/presentations/screens/cart/cart.dart';
import 'package:shoesapp/shoesapp/presentations/screens/filter/filters.dart';
// import 'package:shoesapp/shoesapp/presentations/screens/constants.dart';
import 'package:shoesapp/shoesapp/presentations/screens/homedisplay/shoesgridview.dart';

import '../../../core/services/get.dart';
import 'cart/riverpod/cartriverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: appPlatform,
        builder: (context, platform, child) => DefaultTabController(
              key: Get.key(platform),
              length: 7,
              child: Scaffold(
                backgroundColor: Get.bottomColor,
                floatingActionButton: AppIconButton(
                    icon: Get.filter,
                    color: Get.scaffoldBackgroundColor,
                    text: "FILTER",
                    onTap: () => Get.to(const FilterPage())),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                appBar: AppBar(
                    key: Get.uniqueKey,
                    automaticallyImplyLeading: false,
                    backgroundColor: Get.bottomColor,
                    centerTitle: false,
                    title: Text("Discover", style: Get.bodyLarge.px29),
                    actions: [
                      AppIcon(
                        Get.appswitch,
                        color: Get.disabledColor,
                        onTap: () {
                          if (Get.isIOS) {
                            Meta.showToast("Android View");
                            appPlatform.value = PlatformStyle.Material;
                            return;
                          }
                          appPlatform.value = PlatformStyle.Cupertino;
                          Meta.showToast("Ios View");
                        },
                      ),
                      20.horizontalSpace,
                      const CartIcon(),
                      10.horizontalSpace
                    ],
                    bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: AppColors.transparent,
                        labelStyle: Get.bodyLarge.px19,
                        isScrollable: true,
                        unselectedLabelColor: Get.disabledColor.o5,
                        tabs: const [
                          Text("All"),
                          Text("Nike"),
                          Text("Jordan"),
                          Text("Adidas"),
                          Text("Reebok"),
                          Text("Puma"),
                          Text("Vans")
                        ])),
                body: const TabBarView(children: [
                  ShoesGridView(),
                  ShoesGridView(brand: "Nike"),
                  ShoesGridView(brand: "Jordan"),
                  ShoesGridView(brand: "Adidas"),
                  ShoesGridView(brand: "Reebok"),
                  ShoesGridView(brand: "Puma"),
                  ShoesGridView(brand: "Vans"),
                ]),
              ),
            ));
  }
}

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cartProvider = ref.watch(myCarts);
        final icon = AppIcon(Get.bag,
            padding: EdgeInsets.zero, onTap: () => Get.to(const CartPage()));
        return cartProvider.when(
            error: (error, stackTrace) => icon,
            loading: () => icon,
            data: (data) {
              if (data.isEmpty) {
                return icon;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0).r,
                child: Badge(child: icon),
              );
            });
      },
    );
  }
}
