import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesapp/shoesapp/presentations/screens/homescreen.dart';

import 'core/configs/exportconfig.dart';
import 'core/services/get.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: AppColors.transparent));
  runApp(const ProviderScope(child: Core()));
}

class Core extends ConsumerWidget {
  const Core({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
        valueListenable: appPlatform,
        builder: (context, platform, child) => ScreenUtilInit(
            minTextAdapt: true,
            ensureScreenSize: true,
            splitScreenMode: true,
            builder: (context, child) => PlatformProvider(
                key: Get.key(platform),
                settings: PlatformSettingsData(
                    iosUsesMaterialWidgets: true,
                    matchMaterialCaseForPlatformText: false,
                    legacyIosUsesMaterialWidgets: true,
                    iosUseZeroPaddingForAppbarPlatformIcon: true,
                    platformStyle: PlatformStyleData(android: platform)),
                builder: (context) => PlatformTheme(
                    key: Get.key(ThemeMode.system),
                    themeMode: ThemeMode.system,
                    materialLightTheme: AppThemes.lightTheme,
                    materialDarkTheme: AppThemes.darkTheme,
                    cupertinoLightTheme: AppThemes.ioslightTheme,
                    cupertinoDarkTheme: AppThemes.iosdarkTheme,
                    builder: (context) => PlatformApp(
                          key: const ValueKey("Shopify"),
                          debugShowCheckedModeBanner: false,
                          navigatorKey: navigatorKey,
                          scrollBehavior: Get.scrollBehaviour,
                          localizationsDelegates: const <LocalizationsDelegate<
                              dynamic>>[
                            DefaultMaterialLocalizations.delegate,
                            DefaultCupertinoLocalizations.delegate,
                            DefaultWidgetsLocalizations.delegate
                          ],
                          home: const HomeScreen(),
                        )))));
  }
}
