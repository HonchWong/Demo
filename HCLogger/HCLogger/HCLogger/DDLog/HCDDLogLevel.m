//
//  HCDDLogLevel.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/2.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDDLogLevel.h"

static DDLogLevel _ddLogLevel = DDLogLevelAll;

@implementation HCDDLogLevel

+ (DDLogLevel)ddLogLevel {
    return _ddLogLevel;
}

+ (void)ddSetLogLevel:(DDLogLevel)level
{
    _ddLogLevel = level;
}

@end
