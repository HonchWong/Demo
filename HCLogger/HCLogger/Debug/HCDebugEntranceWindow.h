//
//  HCDebugEntranceWindow.h
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HCDebugEntranceWindowEventDelegate <NSObject>

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow;

@end

@interface HCDebugEntranceWindow : UIWindow

@property (nonatomic, weak) id <HCDebugEntranceWindowEventDelegate> eventDelegate;

@end
