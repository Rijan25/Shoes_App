import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../services/get.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key,
      required this.title,
      this.leading,
      this.subtitle,
      this.onTap,
      this.trailing,
      this.titleStyle,
      this.iosPadding,
      this.materialHeight,
      this.materialWidth,
      this.materialPadding,
      this.iosTitleGap});

  final String title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? iosPadding;
  final double? materialHeight;
  final double? materialWidth;
  final double? iosTitleGap;
  final EdgeInsetsGeometry? materialPadding;
  @override
  Widget build(BuildContext context) {
    return PlatformListTile(
      title: Text(title,
          style: titleStyle ?? Get.bodyMedium.px17,
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
      onTap: onTap,
      leading: leading,
      material: (context, platform) {
        return MaterialListTileData(
            visualDensity: VisualDensity(
                vertical: materialHeight ?? -2.5,
                horizontal: materialWidth ?? 0),
            titleAlignment: ListTileTitleAlignment.titleHeight,
            isThreeLine: false,
            trailing: Padding(
                padding: materialPadding ?? const EdgeInsets.all(1).r,
                child: trailing),
            subtitle: Padding(
                padding: materialPadding ?? const EdgeInsets.only(top: 5.0).r,
                child: subtitle),
            splashColor: Get.primaryColor.o15,
            minVerticalPadding: 7.r,
            subtitleTextStyle: Get.headlineMedium.px13.disabledO5);
      },
      cupertino: (context, platform) {
        return CupertinoListTileData(
            leadingSize: 40.sp,
            backgroundColorActivated: Get.primaryColor.o15,
            leadingToTitle: iosTitleGap ?? 8.r,
            subtitle: subtitle,
            trailing: trailing,
            padding: iosPadding ??
                const EdgeInsets.symmetric(horizontal: 15, vertical: 9).r);
      },
    );
  }
}
