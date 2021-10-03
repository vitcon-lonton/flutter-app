#import "ResourcePlugin.h"
#if __has_include(<resource/resource-Swift.h>)
#import <resource/resource-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "resource-Swift.h"
#endif

@implementation ResourcePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftResourcePlugin registerWithRegistrar:registrar];
}
@end
