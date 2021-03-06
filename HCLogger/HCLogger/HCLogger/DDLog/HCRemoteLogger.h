//
//  HCRemoteLogger.h
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface HCRemoteLogger : DDAbstractLogger <DDLogger>

+ (instancetype)sharedInstance;
- (void)start;
- (void)stop;

@end
