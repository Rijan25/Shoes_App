import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../configs/exportconfig.dart';
import '../../services/get.dart';


class Appdialog extends StatelessWidget {
  const Appdialog(
      {super.key,
      required this.title,
      this.content,
      required this.onchanged,
      this.buttonname = 'Save',
      this.oncancel});

  final String title;
  final Widget? content;
  final VoidCallback onchanged;
  final VoidCallback? oncancel;
  final String? buttonname;

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      key: const ValueKey('content'),
      title: Text(title,
          style: Get.headlineMedium.px18, textAlign: TextAlign.center),
      content: content,
      actions: <Widget>[
        PlatformDialogAction(
          key: const ValueKey("Cancel"),
          onPressed: oncancel ?? () => Get.pop(),
          child: const Text("Cancel", style: TextStyle(color: AppColors.red)),
        ),
        if (buttonname != null)
          PlatformDialogAction(
              key: ValueKey(buttonname),
              onPressed: onchanged,
              child: Text(buttonname!,
                  style: Get.bodyMedium.px14, textAlign: TextAlign.center))
      ],
    );
  }
}
