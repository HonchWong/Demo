//
//  HCAntennaLogger.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/23.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCAntennaLogger.h"

@interface HCAntennaLogger ()

@property (nonatomic, strong) Antenna *antenna;

@end

@implementation HCAntennaLogger 

- (instancetype)init {
    return [self initWithAntenna:[Antenna sharedLogger]];
}

- (instancetype)initWithAntenna:(Antenna *)antenna {
    if (self = [super init]) {
        self.antenna = antenna;
    }
    return self;
}

- (NSDictionary *)extraLogPayloadFromLogMessage:(DDLogMessage *)logMessage {
    NSDictionary *logPayload = @{
                                 @"file": logMessage.fileName,
                                 @"method": logMessage.function,
                                 @"timestamp": logMessage->_timestamp,
                                 @"log-level": @(logMessage->_level),
                                 };
    return logPayload;
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logString = logMessage->_message;
    
    if (self->_logFormatter) {
        logString = [self->_logFormatter formatLogMessage:logMessage];
    }

    if (logString) {
        NSDictionary *extraLogPayload = [self extraLogPayloadFromLogMessage:logMessage];
        NSMutableDictionary *logPayload = [NSMutableDictionary dictionaryWithDictionary:extraLogPayload];
        logPayload[@"message"] = logString;
        
        [self.antenna log:logPayload];
    }
}
@end
