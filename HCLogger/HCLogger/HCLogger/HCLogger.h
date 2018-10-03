//
//  HCLogger.h
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCXLogHelper.h"
#import "HCDDLogHelper.h"

@interface HCLogger : NSObject

+ (void)setupLogger;
+ (void)flushXLog;
+ (void)closeXLog;

@end

static const char *kModuleViewController = "ViewController";
static const char *kNetwork = "Network";

#define __FILENAME__ (strrchr(__FILE__,'/')+1)

#if DEBUG

#define LOG_ERROR(module, format, ...) \
HCXLog(kLevelError, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__) \
HCDDLog(DDLogLevelError, module, format, ##__VA_ARGS__) \

#define LOG_WARNING(module, format, ...) \
HCXLog(kLevelWarn, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__) \
HCDDLog(DDLogLevelWarning, module, format, ##__VA_ARGS__)

#define LOG_INFO(module, format, ...) \
HCXLog(kLevelInfo, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__) \
HCDDLog(DDLogLevelInfo, module, format, ##__VA_ARGS__)

#define LOG_DEBUG(module, format, ...) \
HCXLog(kLevelDebug, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__) \
HCDDLog(DDLogLevelDebug, module, format, ##__VA_ARGS__)

#else

#define LOG_ERROR(module, format, ...) HCXLog(kLevelError, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__)
#define LOG_WARNING(module, format, ...) HCXLog(kLevelWarn, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__)
#define LOG_INFO(module, format, ...) HCXLog(kLevelInfo, module, __FILENAME__, __LINE__, __FUNCTION__, format, ##__VA_ARGS__)
#define LOG_DEBUG(module, format, ...)

#endif

