import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/services/get.dart';

import 'package:shoesapp/core/sharedwidgets/widgets.dart';
import '../../../../core/sharedwidgets/specialwidgets/appprogressindicator.dart';
import '../../../domains/riverpod.dart';
import '../../viewmodels/shoesviewmodel.dart';

class ShoesGridView extends ConsumerWidget {
  const ShoesGridView({super.key, this.brand});

  final String? brand;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listShoes = ref.watch(shoesList(brand));
    return listShoes.when(
      error: (error, stackTrace) => const Text("An Error Occur"),
      loading: () => const ApprogressIndicator(),
      data: (shoes) {
        if (shoesId.isEmpty) {
          for (var i in shoes) {
            shoesId.add(i.id);
          }
        }
        return GridView.builder(
          itemCount: shoes.length,
          physics: Get.scrollPhysics,
          padding: const EdgeInsets.symmetric(horizontal: 3).r,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            final shoe = shoes[index];
            return ShoesViewModel(shoe);
          },
        );
      },
    );
  }
}

List<String> shoesId = [];
