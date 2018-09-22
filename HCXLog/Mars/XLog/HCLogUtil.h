//
//  HCLogUtil.h
//  HCXLog
//
//  Created by 黄鸿昌 on 2018/9/22.
//  Copyright © 2018年 huanghongchang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCXLogHelper.h"

@interface HCLogUtil : NSObject

+ (void)initialization;

@end

#define __FILENAME__ (strrchr(__FILE__,'/')+1)

/**
 *  Module Logging
 */
#define HCLOG_ERROR(module, format, ...) LogInternal(kLevelError, module, __FILENAME__, __LINE__, __FUNCTION__, @"Error:", format, ##__VA_ARGS__)
#define HCLOG_WARNING(module, format, ...) LogInternal(kLevelWarn, module, __FILENAME__, __LINE__, __FUNCTION__, @"Warning:", format, ##__VA_ARGS__)
#define HCLOG_INFO(module, format, ...) LogInternal(kLevelInfo, module, __FILENAME__, __LINE__, __FUNCTION__, @"Info:", format, ##__VA_ARGS__)
#define HCLOG_DEBUG(module, format, ...) LogInternal(kLevelDebug, module, __FILENAME__, __LINE__, __FUNCTION__, @"Debug:", format, ##__VA_ARGS__)

static const char *kModuleViewController = "ViewController";
static const char *kNetwork = "Network";
