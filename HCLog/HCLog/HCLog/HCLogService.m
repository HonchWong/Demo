//
//  HCLogService.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/22.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCLogService.h"
#import "HCTTYLogFormatter.h"
#import "HCAntennaLogger.h"

unsigned long long const kHCFileLoggerMaxFileSize      = 1024 * 1024;      // 单个日志文件大小上限 (bytes) 1 MB
NSTimeInterval     const kHCFileLoggerRollingFrequency = 2 * 60;           // 单个日志时效上限 (sec) 24 Hours
NSUInteger         const kHCFileLoggerMaxNumLogFiles   = 7;                // 所有日志文件数量上限 (个) 7 Files
unsigned long long const kHCFileLoggerFilesDiskQuota   = 20 * 1024 * 1024; // 所有日志文件大小上限（bytes）20 MB

@implementation HCLogService

+ (void)start {
    [self setupConsoleLogger];
    [self setupFileLogger];
    [self setupAntennaLogger];
}

+ (void)setupConsoleLogger {
    HCTTYLogFormatter *TTYLogFormatter = [[HCTTYLogFormatter alloc] init];
    [[DDTTYLogger sharedInstance] setLogFormatter:TTYLogFormatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

+ (void)setupFileLogger {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:documentsDirectory];
    [logFileManager setMaximumNumberOfLogFiles:kHCFileLoggerMaxNumLogFiles];
    [logFileManager setLogFilesDiskQuota:kHCFileLoggerFilesDiskQuota];
    
    DDFileLogger *fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
    fileLogger.rollingFrequency = kHCFileLoggerRollingFrequency;
    fileLogger.maximumFileSize = kHCFileLoggerMaxFileSize;

    [DDLog addLogger:fileLogger];
}
     
+ (void)setupAntennaLogger {
//    npm install express-antenna-cocoalumberjack
//    export NODE_EXPRESS_ANTENNA_LOG_PATH=/tmp/  设置log输出路径，默认为null，输出至Console
//    node node_modules/express-antenna-cocoalumberjack/app.js
    CFDictionaryRef dicRef = CFNetworkCopySystemProxySettings();
    const CFStringRef proxyCFstr = (const CFStringRef)CFDictionaryGetValue(dicRef,
                                                                           (const void*)kCFNetworkProxiesHTTPProxy);
    NSString *proxyStr = (__bridge NSString *)proxyCFstr;
    CFRelease(dicRef);
    
    if (!proxyStr) { return; }

    NSString *serverStr = [NSString stringWithFormat:@"http://%@:3205/log/", proxyStr];
    NSURL *logUrl = [NSURL URLWithString:serverStr];
    [[Antenna sharedLogger] addChannelWithURL:logUrl method:@"POST"];
    [[Antenna sharedLogger] startLoggingApplicationLifecycleNotifications];
    
    HCAntennaLogger *logger = [[HCAntennaLogger alloc] initWithAntenna:[Antenna sharedLogger]];
    
    [DDLog addLogger:logger];
}

@end
