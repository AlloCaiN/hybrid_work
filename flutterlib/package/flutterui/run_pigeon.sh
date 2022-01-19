#!/bin/sh

mkdir -p lib/pigeon/
touch lib/pigeon/RenderMessage.dart

mkdir -p ios/Classes/
touch ios/Classes/RenderMessage.h
touch ios/Classes/RenderMessage.mm

mkdir -p android/src/main/java/com/allo/flutterui/pigeon/
touch android/src/main/java/com/allo/flutterui/pigeon/RenderMessage.java

flutter pub run pigeon \
  --input pigeons/message.dart \
  --dart_out lib/render_message.dart \
  --objc_header_out ios/Runner/RenderMessage.h \
  --objc_source_out ios/Runner/RenderMessage.m \
  --java_out android/src/main/java/com/allo/flutterui/pigeon/RenderMessage.java \
  --java_package "com.allo.flutterui.pigeon"