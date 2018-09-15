//
//  HCConfigViewController.m
//  HCAssistant
//
//  Created by 黄鸿昌 on 2018/9/15.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "HCConfigViewController.h"
#import "HCConfigCell.h"
#import "HCRNViewController.h"

static NSString *cellIdentifier = @"collectionViewCellIdentifier";

@interface HCConfigViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray <NSDictionary *>*configDicts;

@end

@implementation HCConfigViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self setupSubview];
}

- (void)setupSubview {
  self.title = @"Config";
  
  UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
  flowLayout.minimumInteritemSpacing = 15;
  flowLayout.minimumLineSpacing = 15;
  CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
  NSInteger lineItemCount = 3;
  CGFloat itemHW =
  screenWidth / lineItemCount
  - (lineItemCount - 1) * 15;
  flowLayout.itemSize = CGSizeMake(itemHW, itemHW);
  
  self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                           collectionViewLayout:flowLayout];
  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;
  self.collectionView.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.collectionView];
  
  [self.collectionView registerClass:[HCConfigCell class]
          forCellWithReuseIdentifier:cellIdentifier];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return self.configDicts.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  HCConfigCell *cell =
  (HCConfigCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
  NSDictionary *dict = [self.configDicts objectAtIndex:indexPath.row];
  NSString *moduleName = [dict objectForKey:@"moduleName"];
  NSString *moduleURL = [dict objectForKey:@"moduleURL"];
  [cell setTitle:moduleName actionURL:moduleURL];

  return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  NSDictionary *dict = [self.configDicts objectAtIndex:indexPath.row];
  NSString *moduleURL = [dict objectForKey:@"moduleURL"];
  HCRNViewController *rnVC = [[HCRNViewController alloc] initWithModuleURL:moduleURL];
  [self.navigationController pushViewController:rnVC
                                       animated:YES];
}

#pragma mark - getter

- (NSArray <NSDictionary *>*)configDicts {
  if (!_configDicts) {
    _configDicts = @[
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    @{
                      @"moduleName": @"Tabbar",
                      @"moduleURL": @"TabbarRNBundleURL",
                      },
                    ];
  }
  return _configDicts;
}

@end
