/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"
#import "HCConfigViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  HCConfigViewController *rootVC = [HCConfigViewController new];
  UINavigationController *navVC = [[UINavigationController alloc] init];
//                                   WithRootViewController:rootVC];
  [navVC setViewControllers:@[rootVC]];
  self.window.rootViewController = navVC;
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
