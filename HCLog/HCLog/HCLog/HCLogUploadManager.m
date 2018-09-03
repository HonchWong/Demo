//
//  HCLogUploadManager.m
//  HCLog
//
//  Created by 黄鸿昌 on 2018/8/26.
//  Copyright © 2018年 黄鸿昌. All rights reserved.
//

//#import "HCLogUploadManager.h"
//#import "HCLogService.h"
//#import <AFNetworking.h>
//#import <SSZipArchive.h>
//
//@implementation HCLogUploadManager
//
//+ (void)upload {
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSString *requestStr = @"http://193.112.107.123:8000/api2/auth-token/";
//    NSDictionary *parameters = @{@"username":@"xxxxxx",
//                                 @"password":@"xxxxxx"};
//    
//    [requestManager POST:requestStr parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSDictionary *resultJsonDic = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingMutableLeaves error:nil];
//        NSString *token = [resultJsonDic objectForKey:@"token"];
//        [self getUploadLink:token];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//    }];
//}
//
//+ (void)getUploadLink:(NSString *)token {
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    NSString *requestStr = @"http://193.112.107.123:8000/api2/repos/1314af0d-4ebd-4c8d-af50-24e3f1f50c0f/upload-link/";
//    [requestManager.requestSerializer setValue:[NSString stringWithFormat:@"Token %@", token]
//                            forHTTPHeaderField:@"Authorization"];
//    
//    [requestManager GET:requestStr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        if (operation.error) { return; }
//        NSMutableString *data = [[NSMutableString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding];
//        NSString *uploadStr = [data substringWithRange:NSMakeRange(1, data.length - 2)];
//        [self uploadfile:uploadStr token:token];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//    }];
//}
//
//+ (void)uploadfile:(NSString *)uploadLink token:(NSString *)token {
//    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *zipPath = [cachesPath stringByAppendingPathComponent:@"log.zip"];
//    BOOL isSuccess = [SSZipArchive createZipFileAtPath:zipPath withContentsOfDirectory:[HCLogService logFileDirectory]];
//    if (!isSuccess) {
//        HCLogDebug(@"上传失败");
//        return;
//    }
//
//    NSData   *fileData = [NSData dataWithContentsOfFile:zipPath];
//    NSString *fileName = [zipPath lastPathComponent];
//    NSString *mimeType = @"application/octet-stream";
//    
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [requestManager POST:uploadLink parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileData:fileData name:@"file" fileName:fileName mimeType:mimeType];
//        [formData appendPartWithFormData:[fileName dataUsingEncoding:NSUTF8StringEncoding] name:@"filename"];
//        [formData appendPartWithFormData:[@"/log-no-password/" dataUsingEncoding:NSUTF8StringEncoding] name:@"parent_dir"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        HCLogDebug(@"上传成功");
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        HCLogDebug(@"上传失败");
//    }];
//}
//
//@end
