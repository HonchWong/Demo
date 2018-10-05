//
//  HCDebugToolViewController.m
//  HCLogger
//
//  Created by 黄鸿昌 on 2018/10/5.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCDebugToolViewController.h"

@interface HCDebugToolViewController ()

@end

@implementation HCDebugToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Event

- (void)donePressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
