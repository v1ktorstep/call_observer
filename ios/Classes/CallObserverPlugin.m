#import "CallObserverPlugin.h"
#if __has_include(<call_observer/call_observer-Swift.h>)
#import <call_observer/call_observer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "call_observer-Swift.h"
#endif

@implementation CallObserverPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCallObserverPlugin registerWithRegistrar:registrar];
}
@end
