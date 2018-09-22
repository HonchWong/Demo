//
//  ViewController.m
//  HCXLog
//
//  Created by 黄鸿昌 on 2018/9/3.
//  Copyright © 2018年 huanghongchang. All rights reserved.
//

#import "ViewController.h"
#import "HCLogUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)logDebugAction {
    HCLOG_DEBUG(kModuleViewController, @"我是Debug");
}

- (IBAction)logInfoAction {
    HCLOG_INFO(kModuleViewController, @"我是Info");
}

- (IBAction)logWarningAction {
    HCLOG_WARNING(kModuleViewController, @"我是Warning");
}

- (IBAction)logErrorAction {
    HCLOG_ERROR(kModuleViewController, @"我是Error");
}

- (IBAction)chageLevel {
//    [HCLogUtil ]
}

@end
