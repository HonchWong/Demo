//
//  HCXLogHelper.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCXLogHelper.h"
#import <mars/xlog/xloggerbase.h>
#import <mars/xlog/xlogger.h>
#import <mars/xlog/appender.h>
#import <sys/xattr.h>

static NSUInteger g_processID = 0;

@implementation HCXLogHelper

+ (void)setupXlog {
    NSString *logPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/log"];
    NSLog(@"logPath %@", logPath);
    
    // set do not backup for logpath
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    setxattr([logPath UTF8String], attrName, &attrValue, sizeof(attrValue), 0, 0);
    
    // init xlog
#if DEBUG
    xlogger_SetLevel(kLevelAll);
#else
    xlogger_SetLevel(kLevelInfo);
#endif
    appender_set_console_log(false);
    appender_open(kAppednerAsync, [logPath UTF8String], "Test", "");
}

+ (void)logWithLevel:(TLogLevel)logLevel moduleName:(const char*)moduleName fileName:(const char*)fileName lineNumber:(int)lineNumber funcName:(const char*)funcName message:(NSString *)message {
    XLoggerInfo info;
    info.level = logLevel;
    info.tag = moduleName;
    info.filename = fileName;
    info.func_name = funcName;
    info.line = lineNumber;
    gettimeofday(&info.timeval, NULL);
    info.tid = (uintptr_t)[NSThread currentThread];
    info.maintid = (uintptr_t)[NSThread mainThread];
    info.pid = g_processID;
    xlogger_Write(&info, message.UTF8String);
}

+ (BOOL)shouldLog:(TLogLevel)level {
    if (level >= xlogger_Level()) {
        return YES;
    }
    
    return NO;
}

+ (void)flushLog {
    appender_flush();
}

+ (void)closeXLog {
    appender_close();
}

@end
