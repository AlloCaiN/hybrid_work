import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutterui/flutterui.dart';
import 'package:flutterui/render_message.dart';

void runFlutterUi2() {
  runApp(MyApp2());
}
class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  FLTextureInfo? info = null;
  int _mode = 0;
  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Flutterui.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    try {
      await Flutterui.initChannel();
    } on PlatformException {

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

  }

  void _testGLAcquireTexture() async {
        var retInfo = await Flutterui.acquireTexture(300, 300);
        setState(() {
          print("_incrementCounter");
            info = retInfo;
          _mode = 2;
        });
  }

  void _testGLGenerateTexture() async {
    var retInfo = await Flutterui.generateTexture(300, 300);
    setState(() {
      print("_incrementCounter");
      info = retInfo;
      _mode = 1;
    });
  }

  void _testCanvasAcquireTexture() async {
    var retInfo = await Flutterui.acquireCanvasTexture(300, 300);
    setState(() {
      print("_incrementCounter");
      info = retInfo;
      _mode = 2;
    });
  }

  void _testCanvasGenerateTexture() async {
    var retInfo = await Flutterui.generateCanvasTexture(300, 300);
    setState(() {
      print("_incrementCounter");
      info = retInfo;
      _mode = 1;
    });
  }


  Widget? _generateTexture() {
      if(info != null) {
        print("_generateTexture ${info!.textId!}");
        return Texture(textureId: info!.textId!);
      } else return null;

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  _mode == 0 ?Text('Plugin example app') : (_mode == 1 ? Text('生成') : Text('复用')),
        ),
        body: Center(
          child:Column(
            children: [
              SizedBox(width: 300,height: 300,child: _generateTexture()),
              ElevatedButton(
                onPressed: _testGLGenerateTexture,
                child: Text("测试OpenGL生成surfaceTexture"),
              ),
              ElevatedButton(
                onPressed: _testGLAcquireTexture,
                child: Text("测试OpenGL复用surfaceTexture"),
              ),
              ElevatedButton(
                onPressed: _testCanvasGenerateTexture,
                child: Text("测试Canvas生成surfaceTexture"),
              ),
              ElevatedButton(
                onPressed: _testCanvasAcquireTexture,
                child: Text("测试Canvas复用surfaceTexture"),
              ),
            ],
          )
        ),
      ),
    );
  }
}
