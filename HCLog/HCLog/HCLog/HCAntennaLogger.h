//
//  HCAntennaLogger.h
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/23.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <Antenna/Antenna.h>

@interface HCAntennaLogger : DDAbstractLogger <DDLogger>

- (instancetype)initWithAntenna:(Antenna *)antenna;
- (NSDictionary *)extraLogPayloadFromLogMessage:(DDLogMessage *)logMessage;

@end
