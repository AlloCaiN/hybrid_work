package com.allo.flutterui.util

import android.content.Context
import android.graphics.Rect
import android.graphics.SurfaceTexture
import android.util.Log
import com.allo.flutterui.manager.AlloFlutterApplication
import com.allo.flutterui.pigeon.RenderMessage
import com.allo.openglmodular.env.gl.GLCustomSurfaceRender
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor

object FlutterEngineManager {
    var engineGroup : FlutterEngineGroup? = null
    const val ENGINE_ID = "render"
    const val RENDER_ENTRY = "render"

    // 如果有就复用，如果没有就重建,这边传入的参数主要形式有engineId 和 entryPoint两个
    fun flutterEngine(context: Context, engineId: String, entryPoint: String): FlutterEngine? {
        // 通过系统的cache去获取缓存
        var engine = FlutterEngineCache.getInstance().get(engineId)
        if (engine == null) {
            // 新建engine
            val app = context.applicationContext as AlloFlutterApplication
            engineGroup = FlutterEngineGroup(context)
            val dartEntryPoint = DartExecutor.DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(), entryPoint
            )
            engine = app.engineGroup.createAndRunEngine(context, dartEntryPoint)
            FlutterEngineCache.getInstance().put(engineId, engine)
        }
        return engine
    }

    fun routeToFlutter(context: Context) {
//        flutterEngine(context,"render","render")
       // val messageCenter = HybridRouteAndMessageHandleCenter(context)
        val intent = FlutterActivity
            .withNewEngine()
            // 指定跳转到 home 路由页面
            .initialRoute("home")
            .build(context)
        context.startActivity(intent)
    }


    fun destroyEngine() {
        FlutterEngineCache.getInstance().get(ENGINE_ID)?.destroy()
    }
    var render :GLCustomSurfaceRender? = null
    fun initGL() {
        render = GLCustomSurfaceRender()
        render?.queue {
            render?.initProgram()
            render?.onDrawFrame()
        }
   }


    fun bindGL(textureId : SurfaceTexture) {
        render?.queue {
            render?.onSurfaceChanged(300,300)
            render?.bindSurface(textureId)
        }
    }


    fun acquireTexture() : SurfaceTexture? {
        return render?.acquireTexture()
    }

    fun requestRender() {
        render?.queue {
            render?.onDrawFrame()
        }
    }
}