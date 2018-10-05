//
//  ViewController.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "ViewController.h"
#import "HCLogger.h"
#import "HCDebugEntranceWindow.h"
#import "HCDebugEntranceViewController.h"

@interface ViewController ()

@property (nonatomic, strong) HCDebugEntranceWindow *debugEntranceWindow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.debugEntranceWindow = [[HCDebugEntranceWindow alloc] initWithFrame:rect];
    HCDebugEntranceViewController *rootVc = [[HCDebugEntranceViewController alloc] init];
    self.debugEntranceWindow.rootViewController = rootVc;
    self.debugEntranceWindow.eventDelegate = rootVc;
}

- (IBAction)logError {
    for (int i = 0; i < 10; i++) {
        LOG_ERROR(kModuleViewController, @"abc");
    }
}
- (IBAction)logWarning {
    LOG_WARNING(kModuleViewController, @"abc");
}
- (IBAction)logInfo {
    LOG_INFO(kModuleViewController, @"abc");
}
- (IBAction)logDebug {
    LOG_DEBUG(kModuleViewController, @"abc");
}
- (IBAction)changLogLevel {
}
- (IBAction)flushXLog {
    [HCLogger flushXLog];
}
- (IBAction)startRemoteLog {
    [HCLogger startRemoteLogger];
}
- (IBAction)showDebugTool {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
