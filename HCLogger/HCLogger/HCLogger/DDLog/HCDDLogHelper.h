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

+ (void)logWithLevel:(DDLogLevel)logLevel
          moduleName:(const char*)moduleName
            message:(NSString *)message;

@end

#define HCDDLog(level, module, format, ...) \
NSString *message = [NSString stringWithFormat:format, ##__VA_ARGS__, nil]; \
[HCDDLogHelper logWithLevel:level moduleName:module message:message];

