#import "FunctionalAdmobFlutterPlugin.h"
#if __has_include(<functional_admob_flutter/functional_admob_flutter-Swift.h>)
#import <functional_admob_flutter/functional_admob_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "functional_admob_flutter-Swift.h"
#endif

@implementation FunctionalAdmobFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFunctionalAdmobFlutterPlugin registerWithRegistrar:registrar];
}
@end
