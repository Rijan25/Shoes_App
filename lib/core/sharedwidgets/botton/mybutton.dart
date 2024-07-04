import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shoesapp/core/sharedwidgets/specialwidgets/mycard.dart';

import '../../configs/exportconfig.dart';
import '../../services/get.dart';
import '../specialwidgets/appprogressindicator.dart';
import 'appicon.dart';

ValueNotifier _notifier = ValueNotifier<bool>(false);

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.bgcolor = AppColors.black,
      this.valueListenable,
      this.radius = 10,
      this.textColor = AppColors.white});
  final VoidCallback? onTap;
  final String text;
  final Color bgcolor;
  final ValueListenable? valueListenable;
  final Color textColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    Color textcolor = textColor;
    Color buttonColor = bgcolor;
    final textstyle = Get.bodyMedium.copyWith(color: AppColors.white);
    final border = BorderRadius.circular(radius).r;
    return SizedBox(
      height: 40.h,
      width: (Get.width - 60).w,
      child: ValueListenableBuilder(
        valueListenable: valueListenable ?? _notifier,
        builder: (context, loading, child) => AbsorbPointer(
          absorbing: loading,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: border, side: BorderSide(color: textcolor))),
            child: loading
                ? ApprogressIndicator(key: key, color: textcolor)
                : AutoSizeText(text,
                    style: textstyle.copyWith(color: textcolor), maxLines: 1),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.style,
      this.padding});

  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ??
            (Get.isIOS
                ? const EdgeInsets.all(8).r
                : const EdgeInsets.all(10).r),
        child: GestureDetector(
            onTap: onPressed,
            child: Text(text, style: style ?? Get.titleLarge.px16.primary)));
  }
}

class AppIconButon extends StatelessWidget {
  const AppIconButon(
      {super.key,
      required this.icon,
      required this.title,
      this.color,
      this.iconColor,
      this.textColor,
      required this.onTap,
      this.padding = 4,
      this.radius = 10});

  final dynamic icon;
  final String title;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onTap;
  final double padding;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: AppIcon(icon, size: 24.sp, color: iconColor ?? textColor),
      label: Padding(
          padding: EdgeInsets.only(left: padding).r,
          child: AutoSizeText(title,
              style: Get.bodyMedium.px16.copyWith(color: textColor))),
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: color ?? Get.primaryColor, width: 1.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius).r))),
    );
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton(
      {super.key,
      required this.icon,
      this.color = Colors.amber,
      required this.text,
      this.padding,
      this.onTap});

  final dynamic icon;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Mycard(
        color: Get.disabledColor,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon(icon, color: color, size: 20.sp, padding: padding),
              10.horizontalSpace,
              Text(text, style: Get.displayMedium.scaffoldBackground),
              10.horizontalSpace
            ],
          ),
        ),
      ),
    );
  }
}
