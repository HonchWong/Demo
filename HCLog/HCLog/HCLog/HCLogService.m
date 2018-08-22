//
//  HCLogService.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/22.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCLogService.h"

@implementation HCLogService

+ (void)start {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end
