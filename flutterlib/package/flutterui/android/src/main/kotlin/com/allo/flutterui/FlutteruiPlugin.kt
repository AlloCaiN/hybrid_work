package com.allo.flutterui

import android.util.Log
import androidx.annotation.NonNull
import com.allo.flutterui.pigeon.RenderMessage
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngineGroup

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

/** FlutteruiPlugin */
class FlutteruiPlugin: FlutterPlugin, MethodCallHandler, RenderMessage.ComposePluginApi {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutterui")
    channel.setMethodCallHandler(this)
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
    Log.i("czf","acquireTexture size ${width} and ${height}")
    return RenderMessage.FLTextureInfo()
  }
}
