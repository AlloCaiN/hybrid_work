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
  FLTextureInfo generateTexture(int width,int height);
  FLTextureInfo testGLUseAcquireTexture(int width,int height);
  FLTextureInfo testGLUseGenerateTexture(int width,int height);
  FLTextureInfo testCanvasUseAcquireTexture(int width,int height);
  FLTextureInfo testCanvasUseGenerateTexture(int width,int height);

}