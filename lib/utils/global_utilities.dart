import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

printLog(String msg){
  if (kDebugMode) {
    print(msg);
  }
}