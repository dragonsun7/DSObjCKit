//
//  AppDelegate.m
//  DSObjCKitDemo
//
//  Created by Dragon Sun on 2017/12/31.
//  Copyright © 2017 Dragon Sun. All rights reserved.
//

#import "AppDelegate.h"
#import <YTKNetwork/YTKNetwork.h>
#import "Request/Requests.h"
#import <AFNetworking/AFNetworking.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 设置网络请求的服务器地址
    YTKNetworkConfig *networkConfig = [YTKNetworkConfig sharedConfig];
    networkConfig.baseUrl = @"https://www.okex.com/api/v1/";
    
    // 获取OKEx最新币币行情数据
    NSString *symbol = @"ltc_btc";
    TickerRequest *request = [[TickerRequest alloc] initWithSymbol:symbol];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        id json = request.responseJSONObject;
        NSLog(@"%@, %@", [json class], json);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"失败");
    }];
    
    return YES;
}

@end
