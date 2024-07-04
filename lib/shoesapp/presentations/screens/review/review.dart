import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/models/shoesmodel.dart';
import 'package:shoesapp/core/sharedwidgets/botton/appicon.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/widgets/displayrating.dart';
import 'package:shoesapp/shoesapp/presentations/screens/review/widgets/reviewpresentation.dart';

import '../../../../core/services/get.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage(this.shoes, {super.key});
  final Shoes shoes;

  @override
  Widget build(BuildContext context) {
    final id = shoes.id;
    return  DefaultTabController(
          length: 6,
          child: Scaffold(
              extendBody: true,
              backgroundColor: Get.bottomColor,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Get.bottomColor,
                title: Text("Review(${shoes.noOfRating})",
                    style: Get.bodyLarge.px20),
                leading: AppIcon(Get.back, onTap: () => Get.pop()),
                actions: [
                  DisplayRating(shoes, showTotal: false),
                  10.horizontalSpace
                ],
                bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Get.scaffoldBackgroundColor,
                    labelStyle: Get.bodyLarge.px18,
                    isScrollable: true,
                    unselectedLabelColor: Get.disabledColor.o5,
                    tabs: const [
                      Text("All"),
                      Text("5 Stars"),
                      Text("4 Stars"),
                      Text("3 Stars"),
                      Text("2 Stars"),
                      Text("1 Stars")
                    ]),
              ),
              body: TabBarView(children: [
                ReviewPresentation(id: id),
                ReviewPresentation(id: id,rate: '5'),
                ReviewPresentation(id: id,rate: '4'),
                ReviewPresentation(id: id,rate: '3'),
                ReviewPresentation(id: id,rate: '2'),
                ReviewPresentation(id: id,rate: '1'),
              ]))
    );
  }
}
