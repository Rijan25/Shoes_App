import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoesapp/core/configs/exportconfig.dart';
import 'package:shoesapp/core/sharedwidgets/botton/appicon.dart';

final appPlatform = ValueNotifier<PlatformStyle>(PlatformStyle.Material);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
typedef Router = Future<Object?>;

abstract final class Get {
//Application State
  static NavigatorState get _currentState => navigatorKey.currentState!;
  static BuildContext get context => _currentState.context;

//dimentions
  static Size get size => MediaQuery.sizeOf(context);
  static double get width => size.width;
  static double get height => size.height;

//Platform Specific
  static bool get isIOS => //Platform.isIOS
      appPlatform.value == PlatformStyle.Cupertino; //TODO change in production
  static ScrollPhysics get scrollPhysics =>
      isIOS ? const BouncingScrollPhysics() : const ClampingScrollPhysics();
  static ScrollBehavior get scrollBehaviour =>
      isIOS ? const CupertinoScrollBehavior() : const MaterialScrollBehavior();
  static TextSelectionControls get selectionControl => isIOS
      ? CupertinoTextSelectionControls()
      : MaterialTextSelectionControls();

//Navigation
  static Router to(Widget page) => _currentState
      .push(platformPageRoute(context: context, builder: (_) => page));
  static Router off(Widget page) => _currentState.pushReplacement(
      platformPageRoute(context: context, builder: (_) => page));
  static Router offAll(Widget page) => _currentState.pushAndRemoveUntil(
      platformPageRoute(context: context, builder: (_) => page),
      (Route<dynamic> route) => false);
  static void pop() => _currentState.pop();

//Theme
  static ThemeData get _theme => Theme.of(context);
  static TextTheme get _textTheme => _theme.textTheme;

//Screen Brightness
  static Brightness get brightness => _theme.brightness;
  static bool get isDark => brightness == Brightness.dark;

//Theme TextStyles
  static TextStyle get bodyLarge => _textTheme.bodyLarge!;
  static TextStyle get bodyMedium => _textTheme.bodyMedium!;
  static TextStyle get bodySmall => _textTheme.bodySmall!;

  static TextStyle get headlineLarge => _textTheme.headlineLarge!;
  static TextStyle get headlineMedium => _textTheme.headlineMedium!;

  static TextStyle get displayLarge => _textTheme.displayLarge!;
  static TextStyle get displayMedium => _textTheme.displayMedium!;
  static TextStyle get displaySmall => _textTheme.displaySmall!;

  static TextStyle get titleLarge => _textTheme.titleLarge!;
  static TextStyle get titleMedium => _textTheme.titleMedium!;

//Theme Colors
  static Color get scaffoldBackgroundColor => _theme.scaffoldBackgroundColor;
  static Color get unselectedWidgetColor => _theme.unselectedWidgetColor;
  static Color get disabledColor => _theme.disabledColor;
  static Color get primaryColor => _theme.primaryColor;
  static Color get cardColor =>
      isDark ? AppColors.cardBgBlack : AppColors.cardBgWhite;

  static Color get iosBackground => isDark
      ? CupertinoColors.darkBackgroundGray
      : CupertinoColors.extraLightBackgroundGray;

  static Color get bottomColor =>
      isIOS ? iosBackground : scaffoldBackgroundColor;

//file
  static get fileExtension =>
      ['PDF', 'DOCX', 'DOC', 'XLSX', 'XLS', 'PPTX', 'PPT'];
//locale
  static String get local => Localizations.localeOf(context).toString();
//permissions
  // static Future<bool> get storagePermission async =>
  //     await AskPermission.storagePermission;
  // static Future<bool> get bluetoothPermission async =>
  //     await AskPermission.bluetoothPermission;
  // static Future<bool> get cameraPermission async =>
  //     await AskPermission.cameraPermission;
  // static Future<bool> get microphonePermission async =>
  //     await AskPermission.microphonePermission;

//Icons
  static get account => PlatformIcons(context).accountCircle;
  static get settings => PlatformIcons(context).settings;
  static get back => PlatformIcons(context).back;
  static get volumeMute => PlatformIcons(context).volumeMute;
  static get volumeUp => PlatformIcons(context).volumeUp;

  static get rightCheveron => CupertinoIcons.right_chevron;
  static get qrFinder => CupertinoIcons.qrcode_viewfinder;

  static get video => FontAwesomeIcons.video;
  static get phone => Icons.call;
  static get pen => FontAwesomeIcons.pen;

  static get appswitch => Icons.settings_input_component;

  static get bag => AppIcons.shoppingBag;
  static get filter => AppIcons.filter;

  static get bookmarkOutlined => Icons.bookmark_border_outlined;
  static get visibilityOff => Icons.visibility_off_outlined;
  static get visibilityOn => Icons.visibility_outlined;
  static get block => Icons.do_not_disturb_on;
  static get seen => Icons.done_all_outlined;
  static get missed => Icons.phone_missed;
  static get fullScreen => Icons.fullscreen;
  static get security => Icons.security_outlined;
  static get exit => Icons.exit_to_app_outlined;
  static get discuss => Icons.near_me_sharp;
  static get location => Icons.location_on;
  static get file => Icons.text_snippet;
  static get send => Icons.send_rounded;
  static get camera => Icons.camera_alt;
  static get music => Icons.music_note;
  static get verify => Icons.verified;
  static get bookmark => Icons.bookmark;
  static get padLock => Icons.lock_outline;
  static get more => Icons.more_vert;
  static get delete => CupertinoIcons.delete;
  static get close => Icons.close;
  static get support => Icons.support_agent;
  static get cap => Icons.school_outlined;
  static get wave => Icons.graphic_eq;
  static get clear => Icons.clear;
  static get report => Icons.flag;
  static get stop => Icons.stop;
  static get star => Icons.star;
  static get mic => Icons.mic;
  static get info => Icons.info;
  static get link => Icons.link;
  static get pause => Icons.pause;
  static get play => Icons.play_arrow;
  static get attachFile => Icons.attach_file;
  static get halfmoon => Icons.dark_mode;
  static get dropDown => Icons.arrow_drop_down;
  static get remove => Icons.remove;
  static get add => Icons.add;

//Keys
  static Key key(dynamic value) => ValueKey(value ?? uniqueKey.toString());
  static Key get uniqueKey => UniqueKey();
  static PageStorageKey pageStoregeKey(dynamic value) => PageStorageKey(value);

//notifications
}

extension SizeExtension on TextStyle {
  TextStyle get px10 => copyWith(fontSize: 10.sp);
  TextStyle get px11 => copyWith(fontSize: 11.sp);
  TextStyle get px12 => copyWith(fontSize: 12.sp);
  TextStyle get px13 => copyWith(fontSize: 13.sp);
  TextStyle get px14 => copyWith(fontSize: 14.sp);
  TextStyle get px15 => copyWith(fontSize: 15.sp);
  TextStyle get px16 => copyWith(fontSize: 16.sp);
  TextStyle get px17 => copyWith(fontSize: 17.sp);
  TextStyle get px18 => copyWith(fontSize: 18.sp);
  TextStyle get px19 => copyWith(fontSize: 19.sp);
  TextStyle get px20 => copyWith(fontSize: 20.sp);
  TextStyle get px21 => copyWith(fontSize: 21.sp);
  TextStyle get px22 => copyWith(fontSize: 22.sp);
  TextStyle get px23 => copyWith(fontSize: 23.sp);
  TextStyle get px24 => copyWith(fontSize: 24.sp);
  TextStyle get px25 => copyWith(fontSize: 25.sp);
  TextStyle get px26 => copyWith(fontSize: 26.sp);
  TextStyle get px27 => copyWith(fontSize: 27.sp);
  TextStyle get px28 => copyWith(fontSize: 28.sp);
  TextStyle get px29 => copyWith(fontSize: 29.sp);
  TextStyle get px30 => copyWith(fontSize: 30.sp);
  TextStyle get px31 => copyWith(fontSize: 31.sp);
  TextStyle get px32 => copyWith(fontSize: 32.sp);
  TextStyle get px33 => copyWith(fontSize: 33.sp);
  TextStyle get px34 => copyWith(fontSize: 34.sp);
  TextStyle get px35 => copyWith(fontSize: 35.sp);
  TextStyle get px36 => copyWith(fontSize: 36.sp);
  TextStyle get px37 => copyWith(fontSize: 37.sp);
  TextStyle get px38 => copyWith(fontSize: 38.sp);
  TextStyle get px39 => copyWith(fontSize: 39.sp);
  TextStyle get px40 => copyWith(fontSize: 40.sp);
  TextStyle get px15o5 => copyWith(fontSize: 15.5.sp);
}

extension Boldness on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension Textcolor on TextStyle {
  TextStyle get primary => copyWith(color: Get.primaryColor);
  TextStyle get disabled => copyWith(color: Get.disabledColor);
  TextStyle get indigo => copyWith(color: AppColors.indigo);
  TextStyle get indigoA => copyWith(color: AppColors.indigoAccent);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get scaffoldBackground =>
      copyWith(color: Get.scaffoldBackgroundColor);
  TextStyle get disabledO5 => copyWith(color: Get.disabledColor.o5);
  TextStyle get primaryO6 => copyWith(color: Get.primaryColor.o6);
}

extension Styling on TextStyle {
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get h2 => copyWith(height: 2.h);
  TextStyle get h1 => copyWith(height: 1.h);
  TextStyle get h12 => copyWith(height: 1.2.h);
  TextStyle get h15 => copyWith(height: 1.5.h);
}

extension OpacityX on Color {
  Color get o1 => withOpacity(0.1);
  Color get o15 => withOpacity(0.15);
  Color get o2 => withOpacity(0.2);
  Color get o3 => withOpacity(0.3);
  Color get o4 => withOpacity(0.4);
  Color get o5 => withOpacity(0.5);
  Color get o6 => withOpacity(0.6);
  Color get o7 => withOpacity(0.7);
  Color get o8 => withOpacity(0.8);
  Color get o9 => withOpacity(0.9);
  Color get oo4 => withOpacity(0.04);
  Color get oo5 => withOpacity(0.05);
  Color get oo6 => withOpacity(0.06);
  Color get oo8 => withOpacity(0.08);
  Color get oo9 => withOpacity(0.09);
}

extension Stringx on String {
  String get emoji => _emojiDecoder(this);
  bool get isNumber => RegExp(r'^[0-9]{1,20}$').hasMatch(this);
}

String _emojiDecoder(String text) {
  try {
    List<int> bytes = text.codeUnits;
    return utf8.decode(bytes);
  } catch (e) {
    return text;
  }
}
