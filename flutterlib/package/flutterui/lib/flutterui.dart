
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui/render_message.dart';
class Flutterui {
  static const MethodChannel channel =
      const MethodChannel('flutterui');

  static Future<String> get platformVersion async {
    final String version = await channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> initChannel() async {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  }
  static Future<FLTextureInfo> acquireTexture(int width,int height) async {
    // 初始化请求参数
    ComposePluginApi api = ComposePluginApi();
    FLTextureInfo reply = await api.acquireTexture(width,height);
    return reply;
  }

}


