import 'package:flutter/services.dart';
class MessageCenter {
  static const BasicMessageChannel messageChannel = BasicMessageChannel("com.allo.fluttermodule.event.message.channel", StandardMessageCodec());

  static Future<dynamic> sendMessage(Object message) async {
    dynamic result = await messageChannel.send(message);
    print("*******$result");
    return result;
  }

}

