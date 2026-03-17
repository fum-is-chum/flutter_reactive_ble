#import "ReactiveBlePlugin.h"
#import <scallop_reactive_ble_mobile/scallop_reactive_ble_mobile-Swift.h>

@implementation ReactiveBlePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftReactiveBlePlugin registerWithRegistrar:registrar];
}
@end
