#import "FlurryAnalyticsPlugin.h"
#import <flurry_analytics/flurry_analytics-Swift.h>

@implementation FlurryAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlurryAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
