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

+ (void)logWithLevel:(DDLogLevel)logLevel
          moduleName:(const char*)moduleName
             message:(NSString *)message {
    // MRAK - todo 根据module 过滤 log
    switch (logLevel) {
        case DDLogLevelOff:
            break;
        case DDLogLevelError:
            DDLogError(message);
            break;
        case DDLogLevelWarning:
            DDLogWarn(message);
            break;
        case DDLogLevelInfo:
            DDLogInfo(message);
            break;
        case DDLogLevelDebug:
            DDLogDebug(message);
            break;
        case DDLogLevelVerbose:
            DDLogVerbose(message);
            break;
        case DDLogLevelAll:
            break;
    }
}

@end
