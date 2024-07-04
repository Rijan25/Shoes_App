import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../configs/exportconfig.dart';

abstract final class Meta {
  static showToast(String message, {Color color = AppColors.primary}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}