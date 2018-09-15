//
//  HCConfigCell.m
//  HCAssistant
//
//  Created by 黄鸿昌 on 2018/9/15.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "HCConfigCell.h"

@interface HCConfigCell ()

@property (nonatomic, strong) UILabel *moduleNameLabel;

@end

@implementation HCConfigCell


- (void)setTitle:(NSString *)moduleName actionURL:(NSString *)moduleURL {
  self.moduleNameLabel.text = moduleName;
  [self.moduleNameLabel sizeToFit];
//  self.backgroundColor = [UIColor colorWithWhite:7 alpha:0.2];
  self.backgroundColor = [UIColor greenColor;
}

- (void)layoutSubviews {
  _moduleNameLabel.center = self.contentView.center;
}

- (UILabel *)moduleNameLabel {
  if (!_moduleNameLabel) {
    _moduleNameLabel = [[UILabel alloc] init];
    _moduleNameLabel.textColor = [UIColor blackColor];
    _moduleNameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_moduleNameLabel];
  }
  return _moduleNameLabel;
}
@end
