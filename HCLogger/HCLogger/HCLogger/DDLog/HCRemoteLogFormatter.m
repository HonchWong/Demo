//
//  HCRemoteLogFormatter.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCRemoteLogFormatter.h"

@implementation HCRemoteLogFormatter

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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *dateStr = [dateFormatter stringFromDate:[logMessage timestamp]];
    
    NSString *formatStr = [NSString stringWithFormat:@"%@ %@%@ %@(line %lu) message: %@",
                           dateStr,
                           logLevel,
                           logMessage.fileName,
                           logMessage.function,
                           logMessage.line,
                           logMessage.message];
    return formatStr;
}

@end
