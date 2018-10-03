//
//  HCDDLogHelper.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDDLogHelper.h"
#import "HCTTYLogFormatter.h"

@implementation HCDDLogHelper

+ (void)setupDDLog {
    [self setupConsoleLogger];
}

+ (void)setupConsoleLogger {
    HCTTYLogFormatter *TTYLogFormatter = [[HCTTYLogFormatter alloc] init];
    [[DDTTYLogger sharedInstance] setLogFormatter:TTYLogFormatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

+ (BOOL)shouldLog:(const char*)moduleName {
    return YES;
}

@end
