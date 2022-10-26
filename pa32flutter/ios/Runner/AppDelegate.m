#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#define Google_Map_API_Key @"AIzaSyB9uY5b_vmIhvsfALz2XXTyuIknP_V20k4"

@import GoogleMaps;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    [GMSServices provideAPIKey:Google_Map_API_Key];
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
