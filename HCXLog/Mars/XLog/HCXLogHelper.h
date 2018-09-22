//
//  HCXLogHelper.h
//  HCXLog
//
//  Created by 黄鸿昌 on 2018/9/22.
//  Copyright © 2018年 huanghongchang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <mars/xlog/xloggerbase.h>

@interface HCXLogHelper : NSObject

+ (void)logWithLevel:(TLogLevel)logLevel moduleName:(const char*)moduleName fileName:(const char*)fileName lineNumber:(int)lineNumber funcName:(const char*)funcName message:(NSString *)message;
+ (void)logWithLevel:(TLogLevel)logLevel moduleName:(const char*)moduleName fileName:(const char*)fileName lineNumber:(int)lineNumber funcName:(const char*)funcName format:(NSString *)format, ...;

+ (BOOL)shouldLog:(TLogLevel)level;
+ (BOOL)shouldLogWrite:(TLogLevel)level;
//+ (BOOL)shouldLogJustPrint:(TLogLevel)level;


@end

#define LogInternal(level, module, file, line, func, prefix, format, ...) \
do { \
if ([HCXLogHelper shouldLog:level]) { \
NSString *aMessage = [NSString stringWithFormat:@"%@%@", prefix, [NSString stringWithFormat:format, ##__VA_ARGS__, nil]]; \
[HCXLogHelper logWithLevel:level moduleName:module fileName:file lineNumber:line funcName:func message:aMessage]; \
} \
} while(0)
