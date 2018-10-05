//
//  HCDebugEntranceWindow.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugEntranceWindow.h"

@implementation HCDebugEntranceWindow

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelStatusBar + 200;
        self.backgroundColor = [UIColor clearColor];
        self.hidden = NO;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL pointInside = NO;
    if ([self.eventDelegate shouldHandleTouchAtPoint:point]) {
        pointInside = [super pointInside:point withEvent:event];
    }
    return pointInside;
}

@end
