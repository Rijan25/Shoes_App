import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/get.dart';

class Appcheckbox extends StatelessWidget {
  const Appcheckbox({super.key, required this.value, this.onChanged});

  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 1.2,
        filterQuality: FilterQuality.high,
        child: PlatformCheckbox(
            focusColor: Get.disabledColor.o4,
            checkColor: Get.scaffoldBackgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.r)),
            side: BorderSide(color: Get.disabledColor.o6, width: 1.5.w),
            activeColor: Get.disabledColor.o4,
            value: value,
            onChanged: onChanged));
  }
}
