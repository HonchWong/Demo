//
//  HCDDLogHelper.h
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "HCDDLogLevel.h"

#ifdef LOG_LEVEL_DEF
#   undef LOG_LEVEL_DEF
#endif
#define LOG_LEVEL_DEF [HCDDLogLevel ddLogLevel]

@interface HCDDLogHelper : NSObject

+ (void)setupDDLog;
+ (BOOL)shouldLog:(const char*)moduleName;

@end

#define HCDDLog(level, module, format, ...) \
NSString *message = [NSString stringWithFormat:format, ##__VA_ARGS__, nil]; \
if ([HCDDLogHelper shouldLog:module]) { \
    switch (level) { \
        case DDLogLevelOff: \
            break; \
        case DDLogLevelError: \
            DDLogError(message); \
            break; \
        case DDLogLevelWarning: \
            DDLogWarn(message); \
            break; \
        case DDLogLevelInfo: \
            DDLogInfo(message); \
            break; \
        case DDLogLevelDebug: \
            DDLogDebug(message); \
            break; \
        case DDLogLevelVerbose: \
            DDLogVerbose(message); \
            break; \
        case DDLogLevelAll: \
            break; \
    } \
}

