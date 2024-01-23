// 文件：helper.dart

// to help print message for debug

import 'package:flutter/foundation.dart';

void dd(Object? object) {
  String message = "$object";
  final stackTrace = StackTrace.current;
  final frame = stackTrace.toString().split("\n")[1]; // 获取第一个栈帧

  // 使用正则表达式解析出文件名和行号
  final regex = RegExp(r'#[0-9]+\s+(.+)\s\(([^\s]+)\)');
  final match = regex.firstMatch(frame);

  if (match != null) {
    final fileName = match.group(1);
    final lineInfo = match.group(2);
    debugPrint("[$fileName:$lineInfo] - $message \r\n|------------|");
  }
}
