import 'package:pigeon/pigeon.dart';

class FLTextureInfo {
  late int width;
  late int height;
  late int textId;
}

@HostApi()
abstract class ComposePluginApi {
  // 获取texture id
  FLTextureInfo acquireTexture(int width,int height);
}