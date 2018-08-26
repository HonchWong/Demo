//
//  HCLogService.h
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/22.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "HCDynamicLoggerLevel.h"

#ifdef LOG_LEVEL_DEF
#   undef LOG_LEVEL_DEF
#endif
#define LOG_LEVEL_DEF [HCDynamicLoggerLevel ddLogLevel]

typedef NS_ENUM(NSUInteger, HCLogLevel){
    HCLogLevelOff,
    HCLogLevelError,
    HCLogLevelWarning,
    HCLogLevelInfo,
    HCLogLevelDebug,
    HCLogLevelVerbose,
    HCLogLevelAll
};

#define HCLogError(frmt, ...)      DDLogError(frmt, ##__VA_ARGS__)
#define HCLogWarning(frmt, ...)    DDLogWarn(frmt, ##__VA_ARGS__)
#define HCLogInfo(frmt, ...)       DDLogInfo(frmt, ##__VA_ARGS__)
#define HCLogDebug(frmt, ...)      DDLogDebug(frmt, ##__VA_ARGS__)
#define HCLogVerbose(frmt, ...)    DDLogVerbose(frmt, ##__VA_ARGS__)

@interface HCLogService : NSObject

+ (void)start;
+ (void)changeLogLevel:(HCLogLevel)logLevel;
+ (NSString *)logFileDirectory;

@end
