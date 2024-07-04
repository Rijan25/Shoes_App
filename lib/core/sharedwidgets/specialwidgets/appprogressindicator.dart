import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/core/services/get.dart';

class ApprogressIndicator extends StatelessWidget {
  const ApprogressIndicator({super.key, this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformCircularProgressIndicator(
        material: (context, platform) => MaterialProgressIndicatorData(
            key: key, color: color, strokeWidth: 2.sp),
        cupertino: (context, platform) => CupertinoProgressIndicatorData(
            radius: 10.sp, key: key, color: color, animating: true),
      ),
    );
  }
}

class AppLinearProgressIndicator extends StatelessWidget {
  const AppLinearProgressIndicator(
      {super.key, this.color, this.value, this.minHeight = 6});

  final Color? color;
  final double? value;
  final double? minHeight;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
        borderRadius: BorderRadiusDirectional.circular(20.r),
        color: color,
        value: value,
        minHeight: minHeight,
        backgroundColor: color?.o2);
  }
}
