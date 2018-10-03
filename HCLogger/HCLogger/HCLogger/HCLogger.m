//
//  HCLogger.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCLogger.h"

@implementation HCLogger

+ (void)setupLogger {
    [HCXLogHelper setupXlog];
    [HCDDLogHelper setupDDLog];
}

+ (void)flushXLog {
    [HCXLogHelper flushLog];
}

@end
