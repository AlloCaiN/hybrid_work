#import "FlutteruiPlugin.h"
#if __has_include(<flutterui/flutterui-Swift.h>)
#import <flutterui/flutterui-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterui-Swift.h"
#endif

@implementation FlutteruiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutteruiPlugin registerWithRegistrar:registrar];
}
@end
