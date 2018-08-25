//
//  HCDynamicLoggerLevel.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/25.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDynamicLoggerLevel.h"

static DDLogLevel _ddLogLevel = DDLogLevelOff;

@implementation HCDynamicLoggerLevel

+ (DDLogLevel)ddLogLevel {
    return _ddLogLevel;
}

+ (void)ddSetLogLevel:(DDLogLevel)level
{
    _ddLogLevel = level;
}

@end
