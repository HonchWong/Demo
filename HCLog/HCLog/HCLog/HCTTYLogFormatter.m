//
//  HCTTYLogFormatter.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/22.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCTTYLogFormatter.h"

@implementation HCTTYLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel = nil;
    switch (logMessage.flag)
    {
        case DDLogFlagError:
            logLevel = @"👹(ERROR) : ";
            break;
        case DDLogFlagWarning:
            logLevel = @"🙀(WARN)  : ";
            break;
        case DDLogFlagInfo:
            logLevel = @"🗂[INFO]  : ";
            break;
        case DDLogFlagDebug:
            logLevel = @"👨🏻‍💻[DEBUG] : ";
            break;
        case DDLogFlagVerbose:
            logLevel = @"📢[VBOSE] : ";
            break;
    }
    
    NSString *formatStr = [NSString stringWithFormat:@"%@%@ %@(line %lu) message: %@",
                           logLevel,
                           logMessage.fileName,
                           logMessage.function,
                           logMessage.line,
                           logMessage.message];
    return formatStr;
}

@end
