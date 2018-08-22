//
//  HCExpandableLabel.m
//  HCExpandableLabel
//
//  Created by 黄鸿昌 on 2018/8/13.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "HCExpandableLabel.h"
#import <CoreText/CoreText.h>

@interface HCExpandableLabel ()

@property (nonatomic, strong) UIImageView *moreImageView;
@property (nonatomic, copy) NSString *maxLineStr;
@property (nonatomic, assign) BOOL expandable;
@property (nonatomic, assign) BOOL isExpand;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) HCExpandableLabelType type;
@property (nonatomic, copy) NSString *str;
@property (nonatomic, assign) NSInteger maxLine;
@property (nonatomic, assign) CGFloat maxWidth;
@property (nonatomic, strong) UIFont *my_font;
@property (nonatomic, assign) CGFloat my_lineSpacing;
@property (nonatomic, strong) UIColor *my_textColor;
@property (nonatomic, assign) NSInteger my_firstLineHeadIndent;
@end

@implementation HCExpandableLabel

- (instancetype)initWithLabelType:(HCExpandableLabelType)type {
    if (type == QRExpandableLabelType_Normal) {
        CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 30;
        NSInteger maxLine = 5;
        UIFont *textfont = [UIFont systemFontOfSize:14];
        UIColor *color = [UIColor colorWithWhite:0.7f alpha:1.0f];
        CGFloat lineSpacing = 4;
        NSInteger firstLineHeadIndent = 20;
        
        self = [[HCExpandableLabel alloc] initWithMaxLine:maxLine
                                                 maxWidth:maxWidth
                                                 textFont:textfont
                                                textColor:color
                                              lineSpacing:lineSpacing
                                      firstLineHeadIndent:firstLineHeadIndent];
        
//        [self addSubview:self.moreImageView];
    }
    
    return self;
}

- (instancetype)initWithMaxLine:(NSInteger)maxLine
                       maxWidth:(CGFloat)maxWidth
                       textFont:(UIFont *)textFont
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing
            firstLineHeadIndent:(NSInteger)firstLineHeadIndent{
    if (self = [super init]) {
        self.maxWidth = maxWidth;
        self.maxLine = maxLine;
        self.my_font = textFont;
        self.my_textColor = textColor;
        self.my_lineSpacing = lineSpacing;
        self.my_firstLineHeadIndent = firstLineHeadIndent;
        
        self.label = [[UILabel alloc] init];
        self.label.textColor = textColor;
        self.label.font = textFont;
        self.frame = CGRectMake(0, 0, maxWidth, 0);
        self.label.frame = self.frame;
        self.label.numberOfLines = 0;
        [self addSubview:self.label];
    }
    return self;
}

- (void)setDetailText:(NSString *)str {
    self.label.text = str;
    self.str = str;
    
    CGSize size = [self boundingRectWithWidth:self.maxWidth
                                     textFont:self.my_font
                                  lineSpacing:self.my_lineSpacing
                          firstLineHeadIndent:self.my_firstLineHeadIndent
                                         text:str];
    self.bounds = CGRectMake(0, 0, size.width, size.height);
    self.label.frame = CGRectMake(0, 0, size.width, size.height);
    
    NSArray *lineStrs = [self separatedLinesFromLabel:self.label];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    NSString *showStr = str;
    if (lineStrs.count > self.maxLine && self.maxLine > 0) {
        NSMutableString *strs = [NSMutableString string];
        NSInteger count = 0;
        for (NSString *lineStr in lineStrs) {
            count++;
            [strs appendString:lineStr];
            if (count == self.maxLine) {
                [strs replaceCharactersInRange:NSMakeRange(strs.length - 3, 3)
                                    withString:@"..."];
                break;
            }
        }
        self.maxLineStr = strs;
        showStr = strs;
        CGSize size2 = [self boundingRectWithWidth:self.maxWidth
                                         textFont:self.my_font
                                      lineSpacing:self.my_lineSpacing
                              firstLineHeadIndent:self.my_firstLineHeadIndent
                                             text:showStr];
        self.bounds = CGRectMake(0, 0, size2.width, size2.height);
        self.label.frame = CGRectMake(0, 0, size2.width, size2.height);
        
        self.moreImageView.hidden = NO;
        self.expandable = YES;
        
        [paragraphStyle setLineSpacing:self.my_lineSpacing];
    } else if (lineStrs.count == 1) {
        self.expandable = NO;
        self.moreImageView.hidden = YES;
        [self sizeToFit];
        [paragraphStyle setAlignment:NSTextAlignmentCenter];
    } else {
        self.expandable = NO;
        self.moreImageView.hidden = YES;
        [paragraphStyle setLineSpacing:self.my_lineSpacing];
    }
    
    [paragraphStyle setFirstLineHeadIndent:self.my_firstLineHeadIndent];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]
                                                initWithString:showStr
                                                attributes:@{NSFontAttributeName:self.my_font}];
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [showStr length])];
    self.label.attributedText = attributedStr;
}

- (void)changeExpandStatus {
    if (!self.expandable) {
        return;
    }
    
    NSString *showStr;
    if (self.isExpand) {
        showStr = self.maxLineStr;
        self.moreImageView.transform = CGAffineTransformIdentity;
    } else {
        showStr = self.str;
        self.moreImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    self.isExpand = !self.isExpand;
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:showStr
                                                                                      attributes:@{NSFontAttributeName:self.my_font}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:self.my_lineSpacing];
    [paragraphStyle setFirstLineHeadIndent:self.my_firstLineHeadIndent];
    [attributedStr addAttribute:NSParagraphStyleAttributeName
                          value:paragraphStyle
                          range:NSMakeRange(0, [showStr length])];
    self.label.attributedText = attributedStr;
    
    CGSize size = [self boundingRectWithWidth:self.maxWidth
                                      textFont:self.my_font
                                   lineSpacing:self.my_lineSpacing
                           firstLineHeadIndent:self.my_firstLineHeadIndent
                                          text:showStr];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
    self.label.frame = CGRectMake(0, 0, size.width, size.height);
    [self layoutIfNeeded];
}

- (CGSize)boundingRectWithWidth:(CGFloat)maxWidth
                       textFont:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing
            firstLineHeadIndent:(NSInteger)firstLineHeadIndent
                           text:(NSString *)text {
    CGSize maxSize = CGSizeMake(maxWidth, CGFLOAT_MAX);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    //此处设置NSLineBreakByTruncatingTail会导致计算文字高度方法失效
    //[paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setFirstLineHeadIndent:firstLineHeadIndent];
    
    CGSize size = [text boundingRectWithSize:maxSize
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:font,
                                               NSParagraphStyleAttributeName:paragraphStyle}
                                     context:nil].size;
    return size;
}

- (NSArray *)separatedLinesFromLabel:(UILabel *)label  {
    NSString *text = label.text;
    UIFont   *font = label.font;
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];

    //paragraph
    CGFloat lineSpacing = self.my_lineSpacing;
    CGFloat firstLineHeadIndent = self.my_firstLineHeadIndent;
    CTParagraphStyleSetting paragraphSettings[] = {
        {kCTParagraphStyleSpecifierFirstLineHeadIndent, sizeof(firstLineHeadIndent), &firstLineHeadIndent},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(lineSpacing), &lineSpacing},
    };
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(paragraphSettings, sizeof(paragraphSettings) / sizeof(paragraphSettings[0]));
    [attStr addAttribute:(NSString *)kCTParagraphStyleAttributeName value:(__bridge id)paragraphStyle range:NSMakeRange(0, attStr.length)];

    //font
    CTFontRef fontRef = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)fontRef range:NSMakeRange(0, attStr.length)];

    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,label.frame.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc] init];
    
    for (id line in lines) {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    
    CFRelease(paragraphStyle);
    CFRelease(fontRef);
    CFRelease(frameSetter);
    CFRelease(frame);
    CFRelease(path);
    
    return (NSArray *)linesArray;
}

- (UIImageView *)moreImageView {
    if (!_moreImageView) {
        UIImage *image = [UIImage imageNamed:@"more_image"];
        _moreImageView = [[UIImageView alloc] initWithImage:image];
        _moreImageView.hidden = YES;
    }
    return _moreImageView;
}

@end
