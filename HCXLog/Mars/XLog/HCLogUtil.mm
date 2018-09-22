//
//  HCLogUtil.m
//  HCXLog
//
//  Created by 黄鸿昌 on 2018/9/22.
//  Copyright © 2018年 huanghongchang. All rights reserved.
//

#import "HCLogUtil.h"
#import <mars/xlog/xloggerbase.h>
#import <mars/xlog/xlogger.h>
#import <mars/xlog/appender.h>
#import <sys/xattr.h>

@implementation HCLogUtil

+ (void)initialization {
    NSString* logPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/log"];
    
    // set do not backup for logpath
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    setxattr([logPath UTF8String], attrName, &attrValue, sizeof(attrValue), 0, 0);
    
    // init xlog
#if DEBUG
//    xlogger_SetLevel(kLevelAll);
    appender_set_console_log(true);
    //        appender_set_console_log(true);
#else
    xlogger_SetLevel(kLevelInfo);
    appender_set_console_log(false);
#endif
    appender_open(kAppednerAsync, [logPath UTF8String], "Test", "");
}

@end
