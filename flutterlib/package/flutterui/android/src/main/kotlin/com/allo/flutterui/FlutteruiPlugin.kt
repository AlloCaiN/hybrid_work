package com.allo.flutterui

import android.graphics.*
import android.graphics.drawable.BitmapDrawable
import android.util.Log
import android.view.Surface
import androidx.annotation.NonNull
import com.allo.flutterui.pigeon.RenderMessage
import com.allo.flutterui.util.FlutterEngineManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngineGroup

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.view.TextureRegistry

/** FlutteruiPlugin */
class FlutteruiPlugin: FlutterPlugin, MethodCallHandler, RenderMessage.ComposePluginApi {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var textureRegistry: TextureRegistry
  private lateinit var textureEntry: TextureRegistry.SurfaceTextureEntry
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutterui")
    channel.setMethodCallHandler(this)
    textureRegistry = flutterPluginBinding.textureRegistry
    FlutterEngineManager.initGL()
    RenderMessage.ComposePluginApi.setup(flutterPluginBinding.binaryMessenger, this);
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun acquireTexture(width: Long?, height: Long?): RenderMessage.FLTextureInfo {
    return testOpenGL2()
  }

  override fun generateTexture(width: Long?, height: Long?): RenderMessage.FLTextureInfo {
    return testOpenGL()
  }

  override fun testGLUseAcquireTexture(width: Long?, height: Long?): RenderMessage.FLTextureInfo {
    return testOpenGL2()
  }

  override fun testGLUseGenerateTexture(width: Long?, height: Long?): RenderMessage.FLTextureInfo {
    return testOpenGL()
  }

  override fun testCanvasUseAcquireTexture(
    width: Long?,
    height: Long?
  ): RenderMessage.FLTextureInfo {
    return test2()
  }

  override fun testCanvasUseGenerateTexture(
    width: Long?,
    height: Long?
  ): RenderMessage.FLTextureInfo {
    return test1()
  }

  fun testOpenGL() : RenderMessage.FLTextureInfo {
    val info = RenderMessage.FLTextureInfo()
    // var surfaceTexture = SurfaceTexture(0)
    // textureEntry = textureRegistry.registerSurfaceTexture(surfaceTexture)
    textureEntry = textureRegistry.createSurfaceTexture()
    textureEntry.surfaceTexture().setDefaultBufferSize(300,300)
    info.textId = textureEntry.id()
    info.height = 300
    info.width = 300
    FlutterEngineManager.bindGL(textureEntry.surfaceTexture())
    FlutterEngineManager.requestRender()
    return info
  }

  fun testOpenGL2() : RenderMessage.FLTextureInfo {
    val surfaceTexture = FlutterEngineManager.acquireTexture()?:return  RenderMessage.FLTextureInfo()
    val info = RenderMessage.FLTextureInfo()
     textureEntry = textureRegistry.registerSurfaceTexture(surfaceTexture)
    //textureEntry = textureRegistry.createSurfaceTexture()
    textureEntry.surfaceTexture().setDefaultBufferSize(300,300)
    info.textId = textureEntry.id()
    info.height = 300
    info.width = 300
    FlutterEngineManager.bindGL(textureEntry.surfaceTexture())

    FlutterEngineManager.requestRender()
    return info
  }
  fun test1() :RenderMessage.FLTextureInfo {
    val info = RenderMessage.FLTextureInfo()
    // var surfaceTexture = SurfaceTexture(0)
    // textureEntry = textureRegistry.registerSurfaceTexture(surfaceTexture)
    textureEntry = textureRegistry.createSurfaceTexture()
    textureEntry.surfaceTexture().setDefaultBufferSize(300,300)
    info.textId = textureEntry.id()
    info.height = 300
    info.width = 300
    var rect = Rect(0, 0, 300, 300)
    var surface =  Surface(textureEntry.surfaceTexture())
    var canvas = surface.lockCanvas(rect)
    var bitmap = Bitmap.createBitmap(300,300,Bitmap.Config.ARGB_8888)
    var c =  Canvas(bitmap)
    c.drawColor(Color.GREEN)
    canvas.drawBitmap(bitmap, null, rect, null)
    bitmap.recycle()
    surface.unlockCanvasAndPost(canvas)
    return info
  }

  fun test2(): RenderMessage.FLTextureInfo {
    val info = RenderMessage.FLTextureInfo()
    var surfaceTexture = SurfaceTexture(0)
    textureEntry = textureRegistry.registerSurfaceTexture(surfaceTexture)
    surfaceTexture.setDefaultBufferSize(300,300)
    info.textId = textureEntry.id()
    info.height = 300
    info.width = 300
    var rect = Rect(0, 0, 300, 300)
    var surface =  Surface(textureEntry.surfaceTexture())
    var canvas = surface.lockCanvas(rect)
    var bitmap = Bitmap.createBitmap(300,300,Bitmap.Config.ARGB_8888)
    var c =  Canvas(bitmap)
    c.drawColor(Color.GREEN)
    canvas.drawBitmap(bitmap, null, rect, null)
    bitmap.recycle()
    surface.unlockCanvasAndPost(canvas)
    return info
  }
}
