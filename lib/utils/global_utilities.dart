import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payment_getway/utils/apiutils/api_response.dart';
import 'package:logger/logger.dart';

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

delay({int durationSec = 1, required Function click}){
  int sec =  (durationSec*1000);
  Future.delayed(Duration(milliseconds: sec), () {
    click();
  });
}

final logger = Logger();
printLog({String tag = "", required String msg, ApiStatus status = ApiStatus.success}){
  if (kDebugMode) {
    print("$tag : $msg");
    if(status ==ApiStatus.error) {
      logger.e("$tag : $msg");
    }else{
      logger.d("$tag : $msg");
    }
  }
}