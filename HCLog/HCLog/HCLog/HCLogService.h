//
//  HCLogService.h
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/22.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

static const DDLogLevel ddLogLevel = DDLogLevelAll;

#define HCLogError(frmt, ...)      DDLogError(frmt, ##__VA_ARGS__)
#define HCLogWarning(frmt, ...)    DDLogWarn(frmt, ##__VA_ARGS__)
#define HCLogInfo(frmt, ...)       DDLogInfo(frmt, ##__VA_ARGS__)
#define HCLogDebug(frmt, ...)      DDLogDebug(frmt, ##__VA_ARGS__)
#define HCLogVerbose(frmt, ...)    DDLogVerbose(frmt, ##__VA_ARGS__)

@interface HCLogService : NSObject

+ (void)start;

@end
