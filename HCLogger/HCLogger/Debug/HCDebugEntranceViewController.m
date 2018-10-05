//
//  HCDebugEntranceViewController.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugEntranceViewController.h"
#import "HCDebugToolViewController.h"

@interface HCDebugEntranceViewController ()

@property (nonatomic, assign) CGRect touchableFrame;

@end

@implementation HCDebugEntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize viewSize = self.view.frame.size;
    self.touchableFrame = CGRectMake(viewSize.width - 30, 0, 30, 20);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    HCDebugToolViewController *debugVC = [[HCDebugToolViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:debugVC];
    UIViewController *rootVc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootVc presentViewController:navVC animated:YES completion:nil];
}

- (BOOL)shouldHandleTouchAtPoint:(CGPoint)pointInWindow {
    BOOL shouldReceiveTouch = NO;
    CGPoint pointInLocalCoordinates = [self.view convertPoint:pointInWindow fromView:nil];
    
    if (CGRectContainsPoint(self.touchableFrame, pointInLocalCoordinates)) {
        shouldReceiveTouch = YES;
    }
    
    return shouldReceiveTouch;
}


@end
