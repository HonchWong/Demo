//
//  ViewController.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/20.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "ViewController.h"
#import "HCLogService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)logError:(UIButton *)sender {
    HCLogError(@"logError");
}

- (IBAction)logWarning:(UIButton *)sender {
    HCLogWarning(@"logWarning");
}

- (IBAction)logInfo:(UIButton *)sender {
    HCLogInfo(@"logInfo");
}

- (IBAction)logDebug:(UIButton *)sender {
    HCLogDebug(@"logDebug");
}

- (IBAction)logVerbose:(UIButton *)sender {
    HCLogVerbose(@"logVerbose");
}

@end
