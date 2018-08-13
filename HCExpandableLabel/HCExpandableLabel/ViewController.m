//
//  ViewController.m
//  HCExpandableLabel
//
//  Created by 黄鸿昌 on 2018/8/13.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "ViewController.h"
#import "HCExpandableLabel.h"

@interface ViewController ()

@property (nonatomic, strong) HCExpandableLabel *expandableLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    self.expandableLabel = [[HCExpandableLabel alloc]
                            initWithLabelType:QRExpandableLabelType_Normal];
    self.expandableLabel.frame = CGRectMake(15,
                                       100,
                                       width - 15,
                                       0);
    [self.view addSubview:self.expandableLabel];
    
    NSString *data = @"《斗罗大陆》是一部穿越玄幻类型的网络小说，小说签约授权首发连载于起点中文网。小说已经完本，作者是唐家三少。堪称唐家三少最有影响力和代表性的小说之一。该小说讲述了唐门外门弟子唐三到斗罗大陆，在这片武魂的世界再铸唐门的辉煌的故事。主要角色有唐三、小舞、戴沐白等。《斗罗大陆》是一部穿越玄幻类型的网络小说，小说签约授权首发连载于起点中文网。小说已经完本，作者是唐家三少。堪称唐家三少最有影响力和代表性的小说之一。该小说讲述了唐门外门弟子唐三到斗罗大陆，在这片武魂的世界再铸唐门的辉煌的故事。主要角色有唐三、小舞、戴沐白等。《斗罗大陆》是一部穿越玄幻类型的网络小说，小说签约授权首发连载于起点中文网。小说已经完本，作者是唐家三少。堪称唐家三少最有影响力和代表性的小说之一。该小说讲述了唐门外门弟子唐三到斗罗大陆，在这片武魂的世界再铸唐门的辉煌的故事。主要角色有唐三、小舞、戴沐白等。";
    [self.expandableLabel setDetailText:data];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((width - 50) * 0.5,
                                                               (height - 80),
                                                               100,
                                                               50)];
    [btn setTitle:@"change" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(changeLabelStats)
  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)changeLabelStats {
    [self.expandableLabel changeExpandStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
