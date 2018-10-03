//
//  HCXLogHelper.h
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <mars/xlog/xloggerbase.h>

@interface HCXLogHelper : NSObject

+ (void)setupXlog;

+ (void)logWithLevel:(TLogLevel)logLevel
          moduleName:(const char*)moduleName
            fileName:(const char*)fileName
          lineNumber:(int)lineNumber
            funcName:(const char*)funcName
             message:(NSString *)message;

+ (BOOL)shouldLog:(TLogLevel)level;
+ (void)flushLog;

@end

#define HCXLog(level, module, file, line, func, format, ...) \
if ([HCXLogHelper shouldLog:level]) { \
    NSString *aMessage = [NSString stringWithFormat:format, ##__VA_ARGS__, nil]; \
    [HCXLogHelper logWithLevel:level moduleName:module fileName:file lineNumber:line funcName:func message:aMessage]; \
} \
