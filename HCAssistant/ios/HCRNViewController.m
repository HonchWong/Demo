//
//  HCRNViewController.m
//  HCAssistant
//
//  Created by 黄鸿昌 on 2018/9/15.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "HCRNViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface HCRNViewController ()

@end

@implementation HCRNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"RNVC";
//  [self.navigationController.navigationBar settitle] title = @"RNVC";
  
  [self setupRN];
}

- (instancetype)initWithModuleURL:(NSString *)moduleURL {
  if (self = [super init]) {
    
  }
  return self;
}

- (void)setupRN {
    NSURL *jsCodeLocation;
  
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"HCAssistant"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  rootView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
  [self.view addSubview:rootView];
}

@end
