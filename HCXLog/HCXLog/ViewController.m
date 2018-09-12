//
//  ViewController.m
//  HCXLog
//
//  Created by 黄鸿昌 on 2018/9/3.
//  Copyright © 2018年 huanghongchang. All rights reserved.
//

#import "ViewController.h"
#import "LogUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)logDebugAction {
    LOG_DEBUG(kModuleViewController, @"debug");
}

- (IBAction)logInfoAction {
    LOG_DEBUG(kModuleViewController, @"Info");
}

- (IBAction)logWarningAction {
    LOG_DEBUG(kModuleViewController, @"Warning");
}

- (IBAction)logErrorAction {
    LOG_DEBUG(kModuleViewController, @"Error");
}

@end
