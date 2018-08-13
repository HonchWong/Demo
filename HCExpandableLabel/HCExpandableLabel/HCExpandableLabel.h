//
//  HCExpandableLabel.h
//  HCExpandableLabel
//
//  Created by 黄鸿昌 on 2018/8/13.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HCExpandableLabelType) {
    QRExpandableLabelType_Normal,
};

@interface HCExpandableLabel : UIView

- (instancetype)initWithLabelType:(HCExpandableLabelType)type;
- (void)setDetailText:(NSString *)str;
- (void)changeExpandStatus;

@end
