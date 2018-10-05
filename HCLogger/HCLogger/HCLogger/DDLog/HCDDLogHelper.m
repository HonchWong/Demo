//
//  HCDDLogHelper.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDDLogHelper.h"
#import "HCTTYLogFormatter.h"
#import "HCRemoteLogger.h"

@implementation HCDDLogHelper

+ (void)setupDDLog {
    [self setupConsoleLogger];
    [self setupRemoteLogger];
}

#pragma mark - ConsoleLogger
+ (void)setupConsoleLogger {
    HCTTYLogFormatter *TTYLogFormatter = [[HCTTYLogFormatter alloc] init];
    [[DDTTYLogger sharedInstance] setLogFormatter:TTYLogFormatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

+ (BOOL)shouldLog:(const char*)moduleName {
    return YES;
}

#pragma mark - RemoteLogger
+ (void)startRemoteLogger {
    HCRemoteLogger *remoteLogger = [HCRemoteLogger sharedInstance];
    if (![[DDLog allLoggers] containsObject:remoteLogger]) {
        [DDLog addLogger:remoteLogger];
    }
    [remoteLogger start];
}

+ (void)stopRemoteLogger {
    HCRemoteLogger *remoteLogger = [HCRemoteLogger sharedInstance];
    [remoteLogger stop];
    [DDLog removeLogger:remoteLogger];
}

+ (void)setupRemoteLogger {
    HCRemoteLogger *remoteLogger = [HCRemoteLogger sharedInstance];
    [remoteLogger start];
    [DDLog addLogger:remoteLogger];
}

@end
