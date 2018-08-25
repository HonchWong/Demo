//
//  ViewController.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/20.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

#import "ViewController.h"
#import "HCLogService.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)logError:(UIButton *)sender {
    HCLogError(@"logError%@", @"2");
}

- (IBAction)logWarning:(UIButton *)sender {
    HCLogWarning(@"logWarning");
}

- (IBAction)logInfo:(UIButton *)sender {
    HCLogInfo(@"logInfo");
}

- (IBAction)logDebug:(UIButton *)sender {
    HCLogDebug(@"logDebug");
}

- (IBAction)logVerbose:(UIButton *)sender {
    HCLogVerbose(@"logVerbose");
}

- (IBAction)changeLogLevel:(UIButton *)sender {
    if (sender.tag == 0) {
        sender.tag = 1;
        [HCLogService changeLogLevel:HCLogLevelAll];
    } else {
        sender.tag = 0;
        [HCLogService changeLogLevel:HCLogLevelInfo];
    }
}

- (IBAction)upload:(UIButton *)sender {
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *requestStr = @"http://193.112.107.123:8000/api2/auth-token/";
    NSDictionary *parameters = @{@"username":@"625845706@qq.com",
                                 @"password":@"mima123456"};
    [requestManager POST:requestStr parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *resultJsonDic = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableLeaves error:nil];
        NSString *token = [resultJsonDic objectForKey:@"token"];
        [self getUploadLink:token];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];
}

- (void)getUploadLink:(NSString *)token {
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *requestStr = @"http://193.112.107.123:8000/api2/repos/1314af0d-4ebd-4c8d-af50-24e3f1f50c0f/upload-link/";
    [requestManager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token]
                            forHTTPHeaderField:@"Authorization"];
    [requestManager GET:requestStr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (operation.error) { return; }
        NSMutableString *data = [[NSMutableString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding];
        NSString *uploadStr = [data substringWithRange:NSMakeRange(1, data.length - 2)];
        [self uploadfile:uploadStr token:token];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];
}

-(void)uploadfile:(NSString *)uploadLink token:(NSString *)token {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/123.log", documentsDirectory];
    NSData   *fileData = [NSData dataWithContentsOfFile:filePath];
    NSString *fileName = [filePath lastPathComponent];
    NSString *mimeType = @"application/octet-stream";
    
    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [requestManager POST:uploadLink parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:mimeType];
        [formData appendPartWithFormData:[fileName dataUsingEncoding:NSUTF8StringEncoding] name:@"filename"];
        [formData appendPartWithFormData:[@"/log-no-password/" dataUsingEncoding:NSUTF8StringEncoding] name:@"parent_dir"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *resultJsonDic = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"上传成功resultJsonDic-%@",resultJsonDic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败Error-\n%@\n",error);
    }];
}

@end
