// Autogenerated from Pigeon (v1.0.7), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class FLTextureInfo {
  int? width;
  int? height;
  int? textId;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['width'] = width;
    pigeonMap['height'] = height;
    pigeonMap['textId'] = textId;
    return pigeonMap;
  }

  static FLTextureInfo decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return FLTextureInfo()
      ..width = pigeonMap['width'] as int?
      ..height = pigeonMap['height'] as int?
      ..textId = pigeonMap['textId'] as int?;
  }
}

class _ComposePluginApiCodec extends StandardMessageCodec {
  const _ComposePluginApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FLTextureInfo) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is FLTextureInfo) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
    if (value is FLTextureInfo) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else 
    if (value is FLTextureInfo) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else 
    if (value is FLTextureInfo) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else 
    if (value is FLTextureInfo) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      case 129:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      case 130:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      case 131:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      case 132:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      case 133:       
        return FLTextureInfo.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class ComposePluginApi {
  /// Constructor for [ComposePluginApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ComposePluginApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ComposePluginApiCodec();

  Future<FLTextureInfo> acquireTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.acquireTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }

  Future<FLTextureInfo> generateTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.generateTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }

  Future<FLTextureInfo> testGLUseAcquireTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.testGLUseAcquireTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }

  Future<FLTextureInfo> testGLUseGenerateTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.testGLUseGenerateTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }

  Future<FLTextureInfo> testCanvasUseAcquireTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.testCanvasUseAcquireTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }

  Future<FLTextureInfo> testCanvasUseGenerateTexture(int arg_width, int arg_height) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.ComposePluginApi.testCanvasUseGenerateTexture', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object>[arg_width, arg_height]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null,
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return (replyMap['result'] as FLTextureInfo?)!;
    }
  }
}
